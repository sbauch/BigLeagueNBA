class AuthenticationsController < ApplicationController
  def index
    @authentications = current_user.authentications if current_user
  end

  def create
render :text => request.env["omniauth.auth"].to_yaml
  end

  def destroy
    @authentication = current_user.authentications.find(params[:id])
      @authentication.destroy
      flash[:notice] = "Successfully destroyed authentication."
      redirect_to leagues_path
  end
end
