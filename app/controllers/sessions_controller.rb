class SessionsController < ApplicationController
  
  def create       
    user = User.find_by_provider_and_uid(auth) || User.create_with_omniauth(auth)     
    session[:user_id] = user.id     
    redirect_to root_url
  end
 
  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

  private

  def auth
    request.env["omniauth.auth"]
  end
end
