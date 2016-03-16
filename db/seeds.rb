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
	user = User.new

	user.email = "vitor.vezani@gmail.com"
	user.encrypted_password = "$2a$10$fw5qPxbFMdWfX8vsdmybd.4qe2Nae99UvGg23rL.EEdS69T.hKQ5G"
	#user.encrypted_password = "$2a$10$vibfF3pOzLkRuR4VT2bHDeyTqdW8yZ6kwGT016QLlkX3oW4kozvAe" # 123456
	user.reset_password_token = nil
	user.reset_password_sent_at = nil
	user.remember_created_at = "2016-03-14 02:02:17.320308"
	user.sign_in_count = 0
	user.current_sign_in_at = "2016-03-14 02:02:17.335391"
	user.last_sign_in_at = "2016-03-10 22:28:53.280797"
	user.current_sign_in_ip = "127.0.0.1"
	user.last_sign_in_ip = "127.0.0.1"
	user.created_at = "2016-03-10 22:28:27.392224"
	user.updated_at = "2016-03-14 02:02:17.336226"
	user.first_name = "Vitor"
	user.last_name = "Vezani"
	user.confirmation_token = "99FsQp6TyjvUB4oW1HsB"
	user.confirmed_at = "2016-03-10 22:28:46.637631"
	user.confirmation_sent_at = "2016-03-10 22:28:27.528375"
	user.unconfirmed_email = nil
	user.admin = true

	user.save(validate: false)
#when "production"
end