class CallbacksController < Devise::OmniauthCallbacksController
  def github
    @user = User.from_omniauth(request.env["omniauth.auth"])
    sign_in @user
    redirect_to root_url
  end

  def failure
    redirect_to root_url
  end
end
