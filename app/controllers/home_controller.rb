class HomeController < ApplicationController

  def about
    add_breadcrumb "Sobre", :about_path
  end

  def contact
    add_breadcrumb "Contato", :contact_path
  end

  # GET /top
  def top
    add_breadcrumb "Tops do Dia", :top_path

    respond_to do |format|
      format.html do
        top_products = Promotion.includes(:store, :user).where("created_at >= ?", Time.zone.now.beginning_of_day)
        top_coupons = Coupon.includes(:store, :user).where("created_at >= ?", Time.zone.now.beginning_of_day)
        unsorted_tops = (top_products | top_coupons)
        @tops = unsorted_tops.sort_by { |k| k[:impressions_count] }
      end
    end
  end

end
