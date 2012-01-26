class League < ActiveRecord::Base
# Associations
has_many :league_memberships
has_many :teams, :through => :league_memberships

end
