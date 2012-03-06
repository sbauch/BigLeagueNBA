class Player < ActiveRecord::Base
# Associations
has_many :player_ownerships
has_many :teams, :through => :player_ownerships
has_many :games, :class_name => "Game", :foreign_key => 'player_name', :primary_key => 'name',
end

public
def season_fantasy
 fgpoints = fgs_sum * 2
 rebpoints = rebs_sum * 1.5
 threepointerpoints = threepointers_sum * 3
 @score = fgpoints + rebpoints + threepointerpoints
end
