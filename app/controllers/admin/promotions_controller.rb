class Admin::PromotionsController < AdminController

  # GET admin/promotions/new
  def new
  end

  # POST admin/promotions/upload
  def upload
    xls_file = params[:xls_file]
    affiliate = params[:affiliate].downcase

    if xls_file.nil?
      redirect_to new_admin_promotion_path, notice: "Por favor, selecione o arquivo"
      return
    end

    xls_service = XlsFileReaderService.new(xls_file, affiliate)
    
    begin
     xls_service.read!
    rescue Exception => ex
      redirect_to new_admin_promotion_path, notice: ex.message
      return
    end

    respond_to do |format|
      format.html { redirect_to new_admin_promotion_path, notice: xls_file.original_filename + ' lido com sucesso. ' + xls_service.itens_read.to_s + " registros lidos!" }
      format.json { head :no_content }
    end

  end

  def index
    @promotions = Promotion.all
  end
end