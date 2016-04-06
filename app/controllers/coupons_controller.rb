class CouponsController < ApplicationController
  add_breadcrumb "Cupons", :coupons_path

  before_action :set_coupon, :add_breadcrumb_coupon, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  # GET /coupons
  # GET /coupons.json
  def index
    @coupons = Coupon.includes(:store, :user).paginate(page: params[:page], per_page: 21).order(created_at: :desc)
  end

  # GET /coupons/1
  # GET /coupons/1.json
  def show
    @new_comment = Comment.new(commentable: @coupon, user: current_user)
    @comments = @coupon.comments.includes(:user).paginate(page: params[:page], per_page: 21 ).recent.limit(10)
    impressionist(@coupon, nil, unique: [:impressionable_type, :impressionable_id, :session_hash])
  end

  # GET /coupons/new
  def new
    @coupon = Coupon.new
  end

  # GET /coupons/1/edit
  def edit
  end

  # POST /coupons
  # POST /coupons.json
  def create
    @coupon = Coupon.new(coupon_params)

    respond_to do |format|
      if @coupon.save
        format.html { redirect_to @coupon, notice: 'Cupom foi criado com sucesso.' }
        format.json { render :show, status: :created, location: @coupon }
      else
        format.html { render :new }
        format.json { render json: @coupon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coupons/1
  # PATCH/PUT /coupons/1.json
  def update
    respond_to do |format|
      if @coupon.update(coupon_params)
        format.html { redirect_to @coupon, notice: 'Cupom foi atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @coupon }
      else
        format.html { render :edit }
        format.json { render json: @coupon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coupons/1
  # DELETE /coupons/1.json
  def destroy
    @coupon.destroy
    respond_to do |format|
      format.html { redirect_to coupons_url, notice: 'Cupom foi excluído com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coupon
      @coupon = Coupon.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def coupon_params
      params.require(:coupon).permit(:name, :code, :url, :begin_at, :end_at, :enabled, :rules_url, :affiliate, :store_id)
    end

    # Must be executed after CouponController.set_coupon
    def add_breadcrumb_coupon
      add_breadcrumb @coupon.name.truncate(45)
    end
end
