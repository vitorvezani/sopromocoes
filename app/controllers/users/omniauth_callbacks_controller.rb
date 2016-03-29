class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    auth = request.env["omniauth.auth"]
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.from_omniauth_facebook(auth)

    if @user.persisted?
      authenticate!
    else
      # Não cadastrado pelo facebook
      @user = User.find_by_email(auth.info.email)
      if @user.persisted?
        @user.name = auth.info.name
        @user.image_url = auth.info.image
        @user.save
        authenticate!
      else
        session["devise.facebook_data"] = auth
        redirect_to new_user_registration_url
      end
    end
  end

  def failure
    redirect_to root_path
  end

  private
    def authenticate!
      sign_in_and_redirect @user #:event => :authentication this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    end
end
