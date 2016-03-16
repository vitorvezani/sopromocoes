require 'spreadsheet'
require 'roo'

class XlsFileReaderService

		attr_reader :itens_read

	def initialize(file, affiliate)
		@file = file
		@affiliate = affiliate
		@itens_read = 0;
	end
	
	def read!()

	  if @affiliate == "afiliados"

	  	# TODO

	  	csv = Roo::CSV.new(@file.tempfile, :quote_char => "|") # arquivo na memoria

			for i in 2..csv.count

				row = csv.row(i)

			end

	  elsif @affiliate == "lomadee"

			csv = Roo::CSV.new(@file.tempfile, csv_options: {col_sep: "\t", encoding: "Windows-1254"}) # arquivo na memoria	

			if @file.original_filename.include? "ofertas" then

				for i in 2..csv.count

					row = csv.row(i)

					begin
			   		promotion = Promotion.new
			   		promotion.external_id = row[0]
			   		promotion.name = row[1].encode('UTF-8', invalid: :replace, undef: :replace, replace: '')
			   		promotion.image_url = row[2]
			   		promotion.store = find_or_create_store(row, 3)
			   		promotion.discount = row[4]
			   		promotion.price_from = row[5]
			   		promotion.price_to = row[6]
			   		promotion.url = row[7]
			   		promotion.affiliate = @affiliate

			   		promotion.save!

			   		@itens_read = @itens_read + 1

					rescue Exception => ex
						Rails.logger.info "Promoção já existente: " + ex.to_s
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
			   		coupon.name = row[1].encode('UTF-8', invalid: :replace, undef: :replace, replace: '')
			   		coupon.code = row[2]
			   		coupon.url = row[3]
			   		coupon.end_at = row[4]
			   		coupon.affiliate = @affiliate

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