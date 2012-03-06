class RegistrationsController < Devise::RegistrationsController
  
  privat def build_resource(*args)
  super
  if sesion[:omniauth]
  @user.authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid'])
  @user.valid?
end
end
