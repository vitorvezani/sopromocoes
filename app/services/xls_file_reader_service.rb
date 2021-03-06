require 'spreadsheet'
require 'roo'

class XlsFileReaderService

		attr_reader :itens_read

	def initialize(file, affiliate, user)
		@file = file
		@affiliate = affiliate
		@itens_read = 0;
		@user = user
	end

	def read!()

	  if @affiliate == "afiliados"

	  	# TODO

	  	csv = Roo::CSV.new(@file.tempfile, quote_char: "|") # arquivo na memoria

			for i in 2..csv.count

				row = csv.row(i)

			end

	  elsif @affiliate == "lomadee"

			csv = Roo::CSV.new(@file.tempfile, csv_options: {col_sep: "\t", encoding: "UTF-8"}) # arquivo na memoria

			if @file.original_filename.include? "ofertas" then

				for i in 2..csv.count

					row = csv.row(i)

					begin

			   		promotion = Promotion.new
						# offerName 0
						promotion.name = row[0].encode("UTF-8", invalid: :replace, undef: :replace, replace: "")
						# productId 1
						#	offerThumbnail 2
			   		promotion.image_url = row[2]
						#	sellerName 3
			   		promotion.store = find_or_create_store(row, 3)
						#	discountPercentage 4
			   		promotion.discount = row[4]
						#	sellerId 5
						#	sellerThumbnail 6
						#	offerLink 7
						promotion.url = row[7]
						#	priceFrom 8
			   		promotion.price_from = row[8]
						#	sellerEbitLabel 9
						#	offerId 10
						promotion.external_id = row[1]
						#	priceTo 11
						promotion.price_to = row[11]
						#	bpCategoryName 12
						#	categoryId 13
			   		promotion.affiliate = @affiliate
			   		promotion.user = @user

			   		promotion.save!

			   		@itens_read = @itens_read + 1

					rescue Exception => ex
						Rails.logger.info "Oferta já existente: " + ex.to_s
			   	end
				end

			elsif @file.original_filename.include? "cupons" then

				for i in 2..csv.count

					row = csv.row(i)
					#<Coupon id: nil, name: nil, code: nil, url: nil, begin_at: nil, end_at: nil, enabled: true, rules_url: nil,
					# affiliate: nil, user_id: nil, created_at: nil, updated_at: nil, store_id: nil>

					begin
			   		coupon = Coupon.new
			   		coupon.store = find_or_create_store(row, 0)
			   		coupon.name = row[1].encode("UTF-8", invalid: :replace, undef: :replace, replace: "")
			   		coupon.code = row[2]
			   		coupon.url = row[3]
			   		coupon.end_at = row[4]
			   		coupon.affiliate = @affiliate
						coupon.user = @user

			   		coupon.save!

			   		@itens_read = @itens_read + 1

					rescue Exception => ex
						Rails.logger.info "Cupon já existente: " + ex.to_s
			   	end
				end

			else
	  		raise Exception, "Nome de arquivo #{@file.original_filename} não suportado para afiliado #{@affiliate}!"
			end

	  else
	  	raise Exception, "Afiliado #{@affiliate} não suportado!"
	  end
	end

	private

		def find_or_create_store(row, store_index)

			store_name = row[store_index].encode('UTF-8', invalid: :replace, undef: :replace, replace: '')
			store = Store.find_by_name(store_name)

			return store if !store.nil?

			store = Store.new
			store.name = store_name
			store.save!
			return store
		end
end
