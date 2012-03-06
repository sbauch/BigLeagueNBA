class League < ActiveRecord::Base
# Associations
has_many :league_memberships
has_many :teams, :through => :league_memberships

public


def members
 members = self.league_memberships.where(:league_id => self.id)
 teamids = Array.new
 members.each do |m|
   teamids.push m.team_id
 end
team_names = Array.new
teamids.each do |id|
  team_names.push Team.where(:id => id)[0].name
  team_names.push Team.where(:id => id)[0].fantasy_points
  team_names.push Team.where(:id => id)[0].wins
  team_names.push Team.where(:id => id)[0].losses
end
team_names
  
end
end
