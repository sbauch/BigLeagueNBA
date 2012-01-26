class PagesController < ApplicationController
  def home
    raise request.env['omniauth.auth'].inspect
  end

  def my_team
  end

end
