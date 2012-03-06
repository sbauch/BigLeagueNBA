class Team < ActiveRecord::Base
  # Associations
  belongs_to :user
  has_many :player_ownerships
  has_many :leage_memberships
  has_many :leagues, :through => :league_memberships
  has_many :players, :through => :player_ownerships
    
public

def cref
  c_owned = Player.find_all_by_id(self.player_ownerships.find_all_by_position("C").collect{|p| p.player_id})
  # raise centersowned.inspec
 end

def fref 
  f_owned = Player.find_all_by_id(self.player_ownerships.find_all_by_position("F").collect{|p| p.player_id})
end

def gref 
  f_owned = Player.find_all_by_id(self.player_ownerships.find_all_by_position("G").collect{|p| p.player_id})
end

# def active
#   self.games.where(:created_at => PlayerOwnership.find_by_player_id(p.id).created_at.to_date..Date.today)
# end

def score(player_name, player_id)
  now = Date.today
  created = self.player_ownerships.find_by_player_id(player_id).created_at
  if Game.where(:player_name => player_name, :date => created..Date.today).empty?
    @score = 0
  else
  games = Game.where(:player_name => player_name, :date => created..Date.today)
  fgs = Array.new
  rebs = Array.new
  threepointers = Array.new
  games.each do |g|
        fgs.push g.fgs
        rebs.push g.rebs
        threepointers.push g.threepointers
        end
        fgpoints = fgs.sum * 2
        rebpoints = rebs.sum * 1.5
        threepointerpoints = threepointers.sum * 3
        @score = fgpoints + rebpoints + threepointerpoints
 end
 end
def score_sum
  pos = self.player_ownerships.all
  pts = Array.new
  pts.push 0
  pos.each do |p|
   pts.push self.score(Player.find_by_id(p.player_id).name, p.player_id)
           end
  pts.sum
end
end