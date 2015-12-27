# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

case Rails.env
when "development"
	for i in 1..2000
   	promo = Promotion.new();
   	promo.name = Faker::Commerce.product_name;
   	promo.description = Faker::Commerce.department(2, true) #=> "Books & Tools"
		promo.price_from = Faker::Commerce.price
		promo.price_to = Faker::Commerce.price
		promo.price_billet = Faker::Commerce.price
		promo.percent_discount = Faker::Number.between(1, 100) #=> 7
		promo.init_at = Faker::Time.between(DateTime.now - 1, DateTime.now) #=> "2014-09-18 12:30:59 -0700"
		promo.end_at = Faker::Time.between(DateTime.now - 1, DateTime.now) #=> "2014-09-18 12:30:59 -0700"
		promo.created_at = Faker::Time.between(DateTime.now - 1, DateTime.now) #=> "2014-09-18 12:30:59 -0700"
		promo.updated_at = Faker::Time.between(DateTime.now - 1, DateTime.now) #=> "2014-09-18 12:30:59 -0700"
		promo.img_link = Faker::Placeholdit.image("50x50", 'jpg') #=> "http://placehold.it/50x50.jpg/000"
		promo.link = Faker::Internet.url

		promo.save!
	end
#when "production"
end