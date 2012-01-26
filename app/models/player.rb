class Player < ActiveRecord::Base
# Associations
has_many :player_ownerships
has_many :teams, :through => :player_ownerships
has_many :games, :class_name => "Game", :foreign_key => 'player_name', :primary_key => 'name',
end

