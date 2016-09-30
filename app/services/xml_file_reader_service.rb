class XmlFileReaderService

		attr_reader :itens_read

	def initialize(file, affiliate, user)
		@file = file
		@affiliate = affiliate
		@itens_read = 0;
		@user = user
	end

	def read!()

	  if @affiliate == "afiliados"

      # TODO: Vitor

    elsif @affiliate == "lomadee"

      doc = Nokogiri::XML(File.open(@file)) do |config|
        config.strict.nonet
      end

      doc.xpath('//offer').each do |offer|

        begin

          # productId 1
          #	sellerId 5
          #	sellerThumbnail 6
          #	sellerEbitLabel 9
          #	bpCategoryName 12
          #	categoryId 13

          promotion = Promotion.new
          promotion.name = offer.xpath('offerName').text
          promotion.description = promotion.name
          promotion.image_url = offer.xpath('offerThumbnail').text
          promotion.store = find_or_create_store(offer.xpath('sellerName').text)
          promotion.discount = offer.xpath('discountPercentage').text
          promotion.url = offer.xpath('offerLink').text
          promotion.price_from = offer.xpath('priceFrom').text
          promotion.external_id = offer.xpath('offerId').text
          promotion.price_to = offer.xpath('priceTo').text

          promotion.affiliate = @affiliate
          promotion.user = @user

          promotion.save!
          @itens_read = @itens_read + 1
        rescue Exception => ex
          Rails.logger.info "Oferta já existente: " + ex.to_s
        end

      end

      doc.xpath('//coupon').each do |read_coupon|

        begin
          #t.string   "name",                                   null: false
          #t.string   "code",                                   null: false
          #t.text     "url"
          #t.datetime "begin_at"
          #t.datetime "end_at"
          #t.boolean  "enabled",                 default: true, null: false
          #t.text     "rules_url"
          #t.string   "affiliate"

          coupon = Coupon.new
          coupon.store = find_or_create_store(read_coupon.xpath('store/name').text)
          coupon.name = read_coupon.xpath('title').text
          coupon.code = read_coupon.xpath('code').text
          coupon.url = read_coupon.xpath('link').text
          coupon.begin_at = read_coupon.xpath('vigency/startDate').text
          coupon.end_at = read_coupon.xpath('vigency/endDate').text
          coupon.affiliate = @affiliate
          coupon.user = @user

          coupon.save!

          @itens_read = @itens_read + 1

        rescue Exception => ex
          Rails.logger.info "Coupon já existente: " + ex.to_s
        end

      end

	  else
	  	raise Exception, "Afiliado #{@affiliate} não suportado!"
	  end
	end

	private

		def find_or_create_store(store_name)

			store_name = store_name
			store = Store.find_by_name(store_name)

			return store if !store.nil?

			store = Store.new
			store.name = store_name
			store.save!
			return store
		end
end
