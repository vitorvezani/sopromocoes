class UsersController < ApplicationController

  PER_PAGE = 12

  add_breadcrumb "Usuários", :users_path

  before_action :set_user, :add_breadcrumb_user, only: [:show, :edit, :update, :destroy]
  before_action :load_activities, :load_promotions, :load_coupons, only: [:show]

  # GET /users/1
  # GET /users/1.json
  def show
    @current_selection = params[:current_selection] or "activities"
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    raise
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'Usuário foi inserido com sucesso' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'Usuário foi atualizado com sucesso' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'Usuário foi excluído com sucesso' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.fetch(:user, {})
    end

    def load_activities
      @activities = PublicActivity::Activity.includes(:owner, :trackable).where(owner_id: @user.id, owner_type: "User").paginate(page: params[:activities], per_page: PER_PAGE).order(created_at: :desc)
    end

    def load_promotions
      @promotions = Promotion.where(user_id: @user.id, enabled: true).includes(:user).paginate(page: params[:promotions], per_page: PER_PAGE).order(created_at: :desc)
    end

    def load_coupons
      @coupons = Coupon.where(user_id: @user.id, enabled: true).includes(:user).paginate(page: params[:coupons], per_page: PER_PAGE).order(created_at: :desc)
    end

    # Must be executed after UserController.set_user
    def add_breadcrumb_user
      add_breadcrumb @user.name_or_username.truncate(45)
    end
end
