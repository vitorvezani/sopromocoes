class Admin::PromotionsController < AdminController

  # GET admin/promotions/new
  def new
  end

  # POST admin/promotions/upload
  def upload
    file = params[:file]
    file_type = params[:file_type]
    affiliate = params[:affiliate].downcase

    if file.nil?
      redirect_to new_admin_promotion_path, notice: "Por favor, selecione o arquivo"
      return
    end

    if file_type == "XML"
      import_service = XmlFileReaderService.new(file.tempfile, affiliate, current_user)
    elsif file_type == "XLS"
      import_service = XlsFileReaderService.new(file.tempfile, affiliate, current_user)
    end

    begin
     import_service.read!
    rescue Exception => ex
      redirect_to new_admin_promotion_path, notice: ex.message
    end

    respond_to do |format|
      format.html { redirect_to new_admin_promotion_path, notice: file.original_filename + ' lido com sucesso. ' + import_service.itens_read.to_s + " registros lidos!" }
      format.json { head :no_content }
    end

  end

  def index
    @promotions = Promotion.all
  end
end
