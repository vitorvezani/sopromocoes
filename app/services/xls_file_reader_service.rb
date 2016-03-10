require 'spreadsheet'
require 'roo'

class XlsFileReaderService

	def initialize(path, affiliate)
		@path = path
		@affiliate = affiliate
	end
	
	def read!()

	  if @affiliate == "afiliados"

	  	# TODO

	  	csv = Roo::CSV.new(@path, :quote_char => "|")

			for i in 2..csv.count

				row = csv.row(i)

	   		promotion = Promotion.new
	   		promotion.external_id = row[0]
	   		promotion.name = row[1]
	   		promotion.image_url = row[2]
	   		#promotion.store = row[3]
	   		promotion.discount = row[4]
	   		promotion.price_from = row[5]
	   		promotion.price_to = row[6]
	   		promotion.url = row[7]
	   		promotion.affiliate = @affiliate

	   		promotion.save!
			end

	  elsif @affiliate == "lomadee"

			csv = Roo::CSV.new(@path, csv_options: {col_sep: "\t", encoding: "Windows-1252"})

			if csv.filename.to_s.include? "ofertas" then

				for i in 2..csv.count

					row = csv.row(i)

		   		promotion = Promotion.new
		   		promotion.external_id = row[0]
		   		promotion.name = row[1]
		   		promotion.image_url = row[2]
		   		#promotion.store = row[3]
		   		promotion.discount = row[4]
		   		promotion.price_from = row[5]
		   		promotion.price_to = row[6]
		   		promotion.url = row[7]
		   		promotion.affiliate = @affiliate

		   		promotion.save!
				end

			elsif csv.filename.to_s.include? "cupons" then

				for i in 2..csv.count

					row = csv.row(i)
					#<Coupon id: nil, name: nil, code: nil, url: nil, begin_at: nil, end_at: nil, enabled: true, rules_url: nil, 
					# affiliate: nil, user_id: nil, created_at: nil, updated_at: nil, store_id: nil>

					begin
			   		coupon = Coupon.new
			   		#coupon.store_id = row[0]
			   		coupon.name = row[1]
			   		coupon.code = row[2]
			   		coupon.url = row[3]
			   		coupon.end_at = row[4]
			   		coupon.affiliate = @affiliate

			   		coupon.save!
					rescue Exception => ex
						Rails.logger.info "Cupon já existente: " + ex.to_s
			   	end
				end

			else
	  		raise 'Nome de arquivo #{@csv.filename} não suportado para afiliado #{@affiliate}!'
			end

	  else
	  	raise 'Afiliado #{@affiliate} não suportado!'
	  end
	end
	
end