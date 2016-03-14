class Admin::PromotionsController < AdminController
  
  # GET admin/promotions/new
  def new
  end

  # POST admin/promotions/upload
  def upload
    xls_file = params[:xls_file]
    affiliate = params[:affiliate].downcase

    file_path = Rails.root.join('public', 'uploads', xls_file.original_filename)

    File.open(file_path, 'wb') do |file|
      file.write(xls_file.read)
    end

    xls_service = XlsFileReaderService.new(file_path, affiliate)
    xls_service.read!

		File.delete(file_path)

    respond_to do |format|
      format.html { redirect_to new_admin_promotion_path, notice: xls_file.original_filename + ' lido com sucesso!' }
      format.json { head :no_content }
    end

  end

  def index
    @promotions = Promotion.all
  end
end