class StoresController < ApplicationController
  before_action :set_store, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  # GET /stores
  # GET /stores.json
  def index
    respond_to do |format|

      format.json do
        if params[:last]
          @stores = Store.offset(params[:last]).limit(10).order(created_at: :desc)
        else
          @stores = Store.limit(10)
        end
        render json: @stores, callback: params[:jsonp]
      end

      format.html do
        @stores = Store.paginate(page: params[:page], per_page: 21 )
      end

    end
  end

  # GET /stores/1
  # GET /stores/1.json
  def show
    @new_comment = Comment.new(commentable: @store, user: current_user)
    @comments = @store.comments.includes(:user).recent.limit(10).all
  end

  # GET /stores/new
  def new
    @store = Store.new
  end

  # GET /stores/1/edit
  def edit
  end

  # POST /stores
  # POST /stores.json
  def create
    @store = Store.new(store_params)

    respond_to do |format|
      if @store.save
        format.html { redirect_to @store, notice: 'Loja foi criada com sucesso.' }
        format.json { render :show, status: :created, location: @store }
      else
        format.html { render :new }
        format.json { render json: @store.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stores/1
  # PATCH/PUT /stores/1.json
  def update
    respond_to do |format|
      if @store.update(store_params)
        format.html { redirect_to @store, notice: 'Loja foi atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @store }
      else
        format.html { render :edit }
        format.json { render json: @store.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stores/1
  # DELETE /stores/1.json
  def destroy
    @store.destroy
    respond_to do |format|
      format.html { redirect_to stores_url, notice: 'Loja foi excluida com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_store
      @store = Store.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def store_params
      params.require(:store).permit(:name, :description, :twitter, :logo_url, :url)
    end
end
