class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def passthru
    render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
    # Or alternatively,
    # raise ActionController::RoutingError.new('Not Found')
  end
public
def twitter
      omniauth = request.env["omniauth.auth"]
      authentication = Authentication.find_by_provider_and_uid(omniauth['provider'], omniauth['uid'])
      if authentication
        flash[:notice] = "Signed in successfully."
        sign_in_and_redirect(:user, authentication.user)
      elsif current_user
        current_user.authentications.create!(:provider => omniauth['provider'], :uid => omniauth['uid'], :secret => omniauth['credentials']['secret'], :token => omniauth['credentials']['token'])
        flash[:notice] = "Authentication successful."
        redirect_to leagues_path
      else
        user = User.new
        user.authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid'], :secret => omniauth['credentials']['secret'], :token => omniauth['credentials']['token'])
        if user.save
          flash[:notice] = "Signed in successfully."
          sign_in_and_redirect(:user, user)
        else
          session[:omniauth] = omniauth.except('extra')
          redirect_to new_user_registration_url
        end
      end
    end
def failure
   set_flash_message :alert, :failure, :kind => failed_strategy.name.to_s.humanize, :reason => failure_message
   redirect_to after_omniauth_failure_path_for(resource_name)
 end

 protected

 def failed_strategy
   env["omniauth.error.strategy"]
 end

 def failure_message
   exception = env["omniauth.error"]
   error   = exception.error_reason if exception.respond_to?(:error_reason)
   error ||= exception.error        if exception.respond_to?(:error)
   error ||= env["omniauth.error.type"].to_s
   error.to_s.humanize if error
 end
end