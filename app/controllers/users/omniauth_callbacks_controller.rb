class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    auth = request.env["omniauth.auth"]
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.from_omniauth_facebook(auth)

    if @user.persisted?
      authenticate!
    else
      # Não cadastrado pelo facebook
      @user_in_database = User.find_by_email(auth.info.email)
      if @user_in_database&.persisted?
        @user_in_database.name = auth.info.name
        @user_in_database.image_url = auth.info.image
        @user_in_database.save
        @user = user_in_database
        authenticate!
      else
        # TODO: BROKEN
        raise
        session["devise.facebook_data"] = auth
        #redirect_to new_user_registration_url
        #authenticate!
        raise
      end
    end
  end

  def failure
    redirect_to root_path
  end

  private
    def authenticate!
      sign_in_and_redirect @user #event: :authentication this will throw if @user is not activated
      set_flash_message(:notice, :success, kind: "Facebook") if is_navigational_format?
    end
end
