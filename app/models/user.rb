class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me 
  
  # My Associations
  has_one :team
  has_many :authentications  

  def twitter
    unless @twitter_user
      provider = self.authentications.find_by_provider('twitter')
      @twitter_user = Twitter::Client.new(:oauth_token => provider.token, :oauth_token_secret => provider.secret) rescue nil
    end
    @twitter_user
  end
  
  def opponents
    opponents = Array.new
    Twitter.oauth_token = self.authentications.where(:provider => "twitter")[0]['token']
    Twitter.oauth_token_secret = self.authentications.where(:provider => "twitter")[0]['secret']
    following = Twitter.friend_ids['ids']
            following.each do |f|
        if Authentication.find_by_uid(f).present?
           id = Authentication.find_by_uid(f)
           opponents.push id['user_id']
        else
          end   
      end
      teams = Array.new
     opponents.each do |o|
       u = User.find_by_id(o)
       teams.push u.team
     end
     teams.sort_by { |t| -t.score_sum }
  end
  
  def wins
    wins = 0
    points = self.opponents.find_all.collect{|t| if t.score_sum < self.team.score_sum then wins = wins + 1 end }
      wins
  end
  
  def losses
    losses = 0
    points = self.opponents.find_all.collect{|t| if t.score_sum > self.team.score_sum then losses = losses + 1 end }
      losses
  end
 
  def self.find_for_twitter_oauth(access_token, signed_in_resource=nil)
    data = access_token.extra.raw_info
    if user = User.where(:email => data.email).first
      user
    else # Create a user with a stub password. 
      User.create!(:email => data.email, :password => Devise.friendly_token[0,20]) 
    end
  end
   
end
