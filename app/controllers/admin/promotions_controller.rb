class Admin::PromotionsController < AdminController
  
  # GET admin/promotions/new
  def new
  end

  # POST admin/promotions/upload
  def upload
    cvs_file = params[:csv_file]
    affiliate = params[:affiliate].downcase

    path = Rails.root.join('public', 'uploads', cvs_file.original_filename)

    File.open(path, 'wb') do |file|
      file.write(cvs_file.read)
    end

    cvs_service = CVSFileReaderService.new(path, affiliate)
    cvs_service.read!

		File.delete(path)
  end
end