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
	user.username = "vitor_vezani"
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

	user.save(validate: false)
when "production"
	user = User.new

	user.email = "clubedasofertas@clubedasofertas.com.br"
	user.username = "clube_das_ofertas"
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

	user.save(validate: false)
end

@parent_category = Category.new(name: 'Moda', parent_id: nil)
@parent_category.save

Category.new(name: 'Roupas', parent_id: @parent_category.id).save
Category.new(name: 'Calçados', parent_id: @parent_category.id).save
Category.new(name: 'Bolsas e Acessórios', parent_id: @parent_category.id).save

@parent_category = Category.new(name: 'Livros', parent_id: nil)
@parent_category.save

Category.new(name: 'Coleções', parent_id: @parent_category.id).save
Category.new(name: 'Administração e Negócios', parent_id: @parent_category.id).save
Category.new(name: 'Direito', parent_id: @parent_category.id).save
Category.new(name: 'Literatura Estrangeira', parent_id: @parent_category.id).save
Category.new(name: 'Literatura Nacional', parent_id: @parent_category.id).save
Category.new(name: 'Auto-ajuda', parent_id: @parent_category.id).save
Category.new(name: 'Romance', parent_id: @parent_category.id).save
Category.new(name: 'Informática', parent_id: @parent_category.id).save
Category.new(name: 'Medicina e Sáude', parent_id: @parent_category.id).save
Category.new(name: 'Religião', parent_id: @parent_category.id).save

@parent_category = Category.new(name: 'DVDs e Blu-ray', parent_id: nil)
@parent_category.save

Category.new(name: 'Coleções', parent_id: @parent_category.id).save
Category.new(name: 'Filmes Infantis e Infanto-Juvenis', parent_id: @parent_category.id).save
Category.new(name: 'Animação', parent_id: @parent_category.id).save
Category.new(name: 'Séries de TV', parent_id: @parent_category.id).save
Category.new(name: 'Blu-ray', parent_id: @parent_category.id).save
Category.new(name: 'Blu-ray 3D', parent_id: @parent_category.id).save

@parent_category = Category.new(name: 'Games', parent_id: nil)
@parent_category.save

Category.new(name: 'Xbox One', parent_id: @parent_category.id).save
Category.new(name: 'Jogos Xbox One', parent_id: @parent_category.id).save
Category.new(name: 'PS4', parent_id: @parent_category.id).save
Category.new(name: 'Jogos PS4', parent_id: @parent_category.id).save
Category.new(name: 'PS3', parent_id: @parent_category.id).save
Category.new(name: 'Jogos PS3', parent_id: @parent_category.id).save
Category.new(name: 'Xbox 360', parent_id: @parent_category.id).save
Category.new(name: 'Jogos Xbox 360', parent_id: @parent_category.id).save
Category.new(name: 'Nintendo WiiU', parent_id: @parent_category.id).save
Category.new(name: 'Jogos Nintendo WiiU', parent_id: @parent_category.id).save
Category.new(name: 'Acessórios de Games', parent_id: @parent_category.id).save
Category.new(name: 'Jogos para PC', parent_id: @parent_category.id).save

@parent_category = Category.new(name: 'Celulares e Tefonia Fixa', parent_id: nil)
@parent_category.save

Category.new(name: 'Android', parent_id: @parent_category.id).save
Category.new(name: 'IPhone', parent_id: @parent_category.id).save
Category.new(name: 'Microsoft', parent_id: @parent_category.id).save
Category.new(name: 'Telefone sem fio', parent_id: @parent_category.id).save
Category.new(name: 'Telefone sem fio com ramal', parent_id: @parent_category.id).save

@parent_category = Category.new(name: 'Informática e Tablets', parent_id: nil)
@parent_category.save

Category.new(name: 'Notebooks e Computadores', parent_id: @parent_category.id).save
Category.new(name: 'Tablets e iPad', parent_id: @parent_category.id).save
Category.new(name: 'Acessórios de Informática', parent_id: @parent_category.id).save

@parent_category = Category.new(name: 'Tv, Áudio e Home Theater', parent_id: nil)
@parent_category.save

Category.new(name: 'TVs', parent_id: @parent_category.id).save
Category.new(name: 'Home Theater', parent_id: @parent_category.id).save
Category.new(name: 'Blu-ray Player', parent_id: @parent_category.id).save
Category.new(name: 'TV de Led', parent_id: @parent_category.id).save
Category.new(name: 'Smart TV', parent_id: @parent_category.id).save
Category.new(name: 'TV 3D', parent_id: @parent_category.id).save
Category.new(name: 'DVD Player', parent_id: @parent_category.id).save
Category.new(name: 'Suporte para TV', parent_id: @parent_category.id).save

@parent_category = Category.new(name: 'Eletrodomésticos', parent_id: nil)
@parent_category.save

Category.new(name: 'Geladeira/Refrigerador', parent_id: @parent_category.id).save
Category.new(name: 'Fogão', parent_id: @parent_category.id).save
Category.new(name: 'Cooktop', parent_id: @parent_category.id).save
Category.new(name: 'Micro-ondas', parent_id: @parent_category.id).save
Category.new(name: 'Forno de Embutir', parent_id: @parent_category.id).save
Category.new(name: 'Lava Louça', parent_id: @parent_category.id).save
Category.new(name: 'Lavadora de Roupas', parent_id: @parent_category.id).save
Category.new(name: 'Lava e Seca', parent_id: @parent_category.id).save
Category.new(name: 'Secadora de Roupas', parent_id: @parent_category.id).save
Category.new(name: 'Freezer', parent_id: @parent_category.id).save
Category.new(name: 'Ar condicionado de Janela', parent_id: @parent_category.id).save
Category.new(name: 'Ar condicionado Split', parent_id: @parent_category.id).save

@parent_category = Category.new(name: 'Móveis e Decoração', parent_id: nil)
@parent_category.save

Category.new(name: 'Colchão', parent_id: @parent_category.id).save
Category.new(name: 'Cama Box', parent_id: @parent_category.id).save
Category.new(name: 'Sofá', parent_id: @parent_category.id).save
Category.new(name: 'Rack, Estante e Painel', parent_id: @parent_category.id).save
Category.new(name: 'Guarda-Roupa e Roupeiro', parent_id: @parent_category.id).save
Category.new(name: 'Estante e Livreiro', parent_id: @parent_category.id).save
Category.new(name: 'Sala de Jantar', parent_id: @parent_category.id).save
Category.new(name: 'Cadeira de Escritório', parent_id: @parent_category.id).save
Category.new(name: 'Cozinha Modulada', parent_id: @parent_category.id).save
Category.new(name: 'Bar', parent_id: @parent_category.id).save
Category.new(name: 'Cama Box Conjugado', parent_id: @parent_category.id).save
Category.new(name: 'Cômoda', parent_id: @parent_category.id).save
Category.new(name: 'Móveis Para Comércio', parent_id: @parent_category.id).save
Category.new(name: 'Luminária', parent_id: @parent_category.id).save
Category.new(name: 'Mesas Para Notebook', parent_id: @parent_category.id).save

@parent_category = Category.new(name: 'Viagens', parent_id: nil)
@parent_category.save

Category.new(name: 'Passagens Aéreas', parent_id: @parent_category.id).save
Category.new(name: 'Hotéis', parent_id: @parent_category.id).save
Category.new(name: 'Pacotes Turísticos', parent_id: @parent_category.id).save
Category.new(name: 'Cruzeiros Marítimos', parent_id: @parent_category.id).save
Category.new(name: 'Seguros', parent_id: @parent_category.id).save
Category.new(name: 'Atrações', parent_id: @parent_category.id).save
Category.new(name: 'Resorts', parent_id: @parent_category.id).save
Category.new(name: 'Praias', parent_id: @parent_category.id).save
Category.new(name: 'Feriados', parent_id: @parent_category.id).save
