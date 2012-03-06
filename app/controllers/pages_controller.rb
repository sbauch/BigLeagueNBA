class PagesController < ApplicationController
  def home
    # raise request.env['omniauth.auth'].inspect
  end

  def my_team
  end
  
  def matchups
    @user = current_user
    @team = current_user.team
    @opponents = current_user.opponents
    @authentications = current_user.authentications

    respond_to do |format|
      format.html # show.html.erb
      format.js  
    end
  	
  end

end
