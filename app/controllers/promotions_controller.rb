class PromotionsController < ApplicationController
  add_breadcrumb "Ofertas", :root_path

  before_action :set_promotion, :add_breadcrumb_promotion, only: [:show, :edit, :update, :destroy, :love]

  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy, :love]

  # GET /promotions
  # GET /promotions.json
  def index

    respond_to do |format|
      format.json do
        if params[:last]
          @promotions = Promotion.includes(:store, :user).offset(params[:last]).limit(10).order(created_at: :desc)
        else
          @promotions = Promotion.includes(:store, :user).limit(10)
        end
        render json: @promotions, callback: params[:jsonp]
      end
      format.html do
        @promotions = Promotion.includes(:store, :user).paginate(page: params[:page], per_page: 21).order(created_at: :desc)
      end
    end
  end

  # GET /promotions/1
  # GET /promotions/1.json
  def show
    @new_comment = Comment.new(commentable: @promotion, user: current_user)
    @comments = @promotion.comments.includes(:user).paginate(page: params[:page], per_page: 21 ).recent.limit(10)
    impressionist(@promotion)
  end

  # GET /promotions/new
  def new
    @promotion = Promotion.new
  end

  # GET /promotions/1/edit
  def edit
  end

  # POST /promotions
  # POST /promotions.json
  def create

    @promotion = Promotion.new(promotion_params)
    @promotion.user = current_user
    @promotion.affiliate = 'LOMADEE'
    @promotion.begin_at = DateTime.now
    @promotion.enabled = true
    #@promotion.discount = CalculatorService.calculate_discount(@promotion)

    respond_to do |format|
      if @promotion.save

        @promotion.image_url = ImageService.save(@promotion)

        @promotion.save

        format.html { redirect_to @promotion, notice: 'Oferta foi criado com sucesso.' }
        format.json { render :show, status: :created, location: @promotion }
      else
        format.html { render :new }
        format.json { render json: @promotion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /promotions/1
  # PATCH/PUT /promotions/1.json
  def update
    respond_to do |format|
      if @promotion.update(promotion_params)
        format.html { redirect_to @promotion, notice: 'Oferta foi atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @promotion }
      else
        format.html { render :edit }
        format.json { render json: @promotion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /promotions/1
  # DELETE /promotions/1.json
  def destroy
    @promotion.destroy
    respond_to do |format|
      format.html { redirect_to promotions_url, notice: 'Oferta foi excluída com sucesso.' }
      format.json { head :no_content }
    end
  end

  def love

    unless current_user.voted_for? @promotion
      @promotion.liked_by current_user
      @success = 'Oferta curtida com sucesso!'
      @is_upvote = true
    else
      @promotion.unliked_by current_user
      @success = 'Oferta descurtida com sucesso!'
    end

    respond_to do |format|
      format.js { render template: "promotions/shared/love" }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_promotion
      @promotion = Promotion.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def promotion_params
      params.require(:promotion).permit(:name, :description, :external_id, :image_url, :discount, :price_from, :price_to, :price_billet, :url, :enabled, :affiliate, :begin_at, :end_at, :store_id)
    end

    # Must be executed after PromotionController.set_promotion
    def add_breadcrumb_promotion
      add_breadcrumb @promotion.name.truncate(45)
    end
end
