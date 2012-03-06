class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :store_location

  def store_location
      session[:user_return_to] = request.url unless params[:controller] == "devise/sessions"
      # If devise model is not User, then replace :user_return_to with :{your devise model}_return_to
  end

  def after_sign_in_path_for(resource)
     current_user.team
  end
  
  def find_team_players
      @team_players = team ? team.players : []  
      true
    end
  
end
