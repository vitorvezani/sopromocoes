class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    raise # NOT IMPLEMENTED YET
    
    auth = request.env['omniauth.auth']
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    # Search for provider and uid
    @user = User.from_omniauth_facebook(auth)

    if @user.persisted?
      authenticate!
    else
      # Cadastrado pelo sistema mas não pelo facebook
      @user_in_database = User.find_by_email(auth.info.email)
      if @user_in_database&.persisted?
        # Atualiza informacoes vindas do facebook
        @user_in_database.name = auth.info.name
        @user_in_database.image_url = auth.info.image
        @user_in_database.provider_facebook = auth.provider
        @user_in_database.uid_facebook = auth.uid
        @user_in_database.save
        @user = @user_in_database
        authenticate!
      else
        #session['devise.facebook_data'] = auth
        #redirect_to new_user_registration_url
        #raise
        authenticate!
      end
    end
  end

  def failure
    redirect_to root_path
  end

  private
    def authenticate!
      raise
      sign_in_and_redirect @user #event: :authentication this will throw if @user is not activated
      set_flash_message(:notice, :success, kind: 'Facebook') if is_navigational_format?
    end
end
