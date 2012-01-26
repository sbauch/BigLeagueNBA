class ApplicationController < ActionController::Base
  protect_from_forgery
  def find_team_players
      @team_players = team ? team.players : []  
      true
    end
  
end
