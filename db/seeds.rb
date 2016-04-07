# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

case Rails.env
when "development"
	user = User.new

	user.email = "vitor.vezani@gmail.com"
	user.email = "vitor_vezani"
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
	user.name = "Vitor Vezani"
	user.confirmation_token = "99FsQp6TyjvUB4oW1HsB"
	user.confirmed_at = "2016-03-10 22:28:46.637631"
	user.confirmation_sent_at = "2016-03-10 22:28:27.528375"
	user.unconfirmed_email = nil
	user.admin = true

	#user.save(validate: false)
when "production"
	user = User.new

	user.email = "clubedasofertas@clubedasofertas.com.br"
	user.email = "clube_das_ofertas"
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
	user.name = "Clube das Ofertas"
	user.confirmation_token = "992sQp6TyjvUB4oW1HsB"
	user.confirmed_at = "2016-03-10 22:28:46.637631"
	user.confirmation_sent_at = "2016-03-10 22:28:27.528375"
	user.unconfirmed_email = nil
	user.admin = true

	#user.save(validate: false)
end

@parent_category = Category.new(text: 'Moda', parent_id: nil)
@parent_category.save

Category.new(text: 'Roupas', parent_id: @parent_category.id).save
Category.new(text: 'Calçados', parent_id: @parent_category.id).save
Category.new(text: 'Bolsas e Acessórios', parent_id: @parent_category.id).save

@parent_category = Category.new(text: 'Livros', parent_id: nil)
@parent_category.save

Category.new(text: 'Coleções', parent_id: @parent_category.id).save
Category.new(text: 'Administração e Negócios', parent_id: @parent_category.id).save
Category.new(text: 'Direito', parent_id: @parent_category.id).save
Category.new(text: 'Literatura Estrangeira', parent_id: @parent_category.id).save
Category.new(text: 'Literatura Nacional', parent_id: @parent_category.id).save
Category.new(text: 'Auto-ajuda', parent_id: @parent_category.id).save
Category.new(text: 'Romance', parent_id: @parent_category.id).save
Category.new(text: 'Informática', parent_id: @parent_category.id).save
Category.new(text: 'Medicina e Sáude', parent_id: @parent_category.id).save
Category.new(text: 'Religião', parent_id: @parent_category.id).save

@parent_category = Category.new(text: 'DVDs e Blu-ray', parent_id: nil)
@parent_category.save

Category.new(text: 'Coleções', parent_id: @parent_category.id).save
Category.new(text: 'Filmes Infantis e Infanto-Juvenis', parent_id: @parent_category.id).save
Category.new(text: 'Animação', parent_id: @parent_category.id).save
Category.new(text: 'Séries de TV', parent_id: @parent_category.id).save
Category.new(text: 'Blu-ray', parent_id: @parent_category.id).save
Category.new(text: 'Blu-ray 3D', parent_id: @parent_category.id).save

@parent_category = Category.new(text: 'Games', parent_id: nil)
@parent_category.save

Category.new(text: 'Xbox One', parent_id: @parent_category.id).save
Category.new(text: 'Jogos Xbox One', parent_id: @parent_category.id).save
Category.new(text: 'PS4', parent_id: @parent_category.id).save
Category.new(text: 'Jogos PS4', parent_id: @parent_category.id).save
Category.new(text: 'PS3', parent_id: @parent_category.id).save
Category.new(text: 'Jogos PS3', parent_id: @parent_category.id).save
Category.new(text: 'Xbox 360', parent_id: @parent_category.id).save
Category.new(text: 'Jogos Xbox 360', parent_id: @parent_category.id).save
Category.new(text: 'Nintendo WiiU', parent_id: @parent_category.id).save
Category.new(text: 'Jogos Nintendo WiiU', parent_id: @parent_category.id).save
Category.new(text: 'Acessórios de Games', parent_id: @parent_category.id).save
Category.new(text: 'Jogos para PC', parent_id: @parent_category.id).save

@parent_category = Category.new(text: 'Celulares e Tefonia Fixa', parent_id: nil)
@parent_category.save

Category.new(text: 'Android', parent_id: @parent_category.id).save
Category.new(text: 'IPhone', parent_id: @parent_category.id).save
Category.new(text: 'Microsoft', parent_id: @parent_category.id).save
Category.new(text: 'Telefone sem fio', parent_id: @parent_category.id).save
Category.new(text: 'Telefone sem fio com ramal', parent_id: @parent_category.id).save

@parent_category = Category.new(text: 'Informática e Tablets', parent_id: nil)
@parent_category.save

Category.new(text: 'Notebooks e Computadores', parent_id: @parent_category.id).save
Category.new(text: 'Tablets e iPad', parent_id: @parent_category.id).save
Category.new(text: 'Acessórios de Informática', parent_id: @parent_category.id).save

@parent_category = Category.new(text: 'Tv, Áudio e Home Theater', parent_id: nil)
@parent_category.save

Category.new(text: 'TVs', parent_id: @parent_category.id).save
Category.new(text: 'Home Theater', parent_id: @parent_category.id).save
Category.new(text: 'Blu-ray Player', parent_id: @parent_category.id).save
Category.new(text: 'TV de Led', parent_id: @parent_category.id).save
Category.new(text: 'Smart TV', parent_id: @parent_category.id).save
Category.new(text: 'TV 3D', parent_id: @parent_category.id).save
Category.new(text: 'DVD Player', parent_id: @parent_category.id).save
Category.new(text: 'Suporte para TV', parent_id: @parent_category.id).save

@parent_category = Category.new(text: 'Eletrodomésticos', parent_id: nil)
@parent_category.save

Category.new(text: 'Geladeira/Refrigerador', parent_id: @parent_category.id).save
Category.new(text: 'Fogão', parent_id: @parent_category.id).save
Category.new(text: 'Cooktop', parent_id: @parent_category.id).save
Category.new(text: 'Micro-ondas', parent_id: @parent_category.id).save
Category.new(text: 'Forno de Embutir', parent_id: @parent_category.id).save
Category.new(text: 'Lava Louça', parent_id: @parent_category.id).save
Category.new(text: 'Lavadora de Roupas', parent_id: @parent_category.id).save
Category.new(text: 'Lava e Seca', parent_id: @parent_category.id).save
Category.new(text: 'Secadora de Roupas', parent_id: @parent_category.id).save
Category.new(text: 'Freezer', parent_id: @parent_category.id).save
Category.new(text: 'Ar condicionado de Janela', parent_id: @parent_category.id).save
Category.new(text: 'Ar condicionado Split', parent_id: @parent_category.id).save

@parent_category = Category.new(text: 'Móveis e Decoração', parent_id: nil)
@parent_category.save

Category.new(text: 'Colchão', parent_id: @parent_category.id).save
Category.new(text: 'Cama Box', parent_id: @parent_category.id).save
Category.new(text: 'Sofá', parent_id: @parent_category.id).save
Category.new(text: 'Rack, Estante e Painel', parent_id: @parent_category.id).save
Category.new(text: 'Guarda-Roupa e Roupeiro', parent_id: @parent_category.id).save
Category.new(text: 'Estante e Livreiro', parent_id: @parent_category.id).save
Category.new(text: 'Sala de Jantar', parent_id: @parent_category.id).save
Category.new(text: 'Cadeira de Escritório', parent_id: @parent_category.id).save
Category.new(text: 'Cozinha Modulada', parent_id: @parent_category.id).save
Category.new(text: 'Bar', parent_id: @parent_category.id).save
Category.new(text: 'Cama Box Conjugado', parent_id: @parent_category.id).save
Category.new(text: 'Cômoda', parent_id: @parent_category.id).save
Category.new(text: 'Móveis Para Comércio', parent_id: @parent_category.id).save
Category.new(text: 'Luminária', parent_id: @parent_category.id).save
Category.new(text: 'Mesas Para Notebook', parent_id: @parent_category.id).save

@parent_category = Category.new(text: 'Viagens', parent_id: nil)
@parent_category.save

Category.new(text: 'Passagens Aéreas', parent_id: @parent_category.id).save
Category.new(text: 'Hotéis', parent_id: @parent_category.id).save
Category.new(text: 'Pacotes Turísticos', parent_id: @parent_category.id).save
Category.new(text: 'Cruzeiros Marítimos', parent_id: @parent_category.id).save
Category.new(text: 'Seguros', parent_id: @parent_category.id).save
Category.new(text: 'Atrações', parent_id: @parent_category.id).save
Category.new(text: 'Resorts', parent_id: @parent_category.id).save
Category.new(text: 'Praias', parent_id: @parent_category.id).save
Category.new(text: 'Feriados', parent_id: @parent_category.id).save
