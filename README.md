# Só Promoções

A ideia do Só Promocoes é ser uma rede social de promocoes e cupons onde o usuário podera cadastrar promocoes e cupons, além de lojas e outras funcionalidades

## Funcionalidades
- Administradores
  - Importação de planilha de promocoes e cupons do sistema de afiliados Lomadee e Afiliados.
  - Management de usuários, ofertas, cupons e lojas
- Usuários
  - Cadastro de promocoes, cupons, tags e lojas(?)
  - Management de ofertas e cupons cadastrados por eles
  - Comentários em itens (comentable)
  - Report de spam (reportable)
- Featues do sistema
  - Management de promocoes, coupons, tags, lojas e usuários
  - Gamification
  - Comentarios
  - Spam
- Monetização
  - Importação de promocoes e cupons de afiliados [verificado!]
  - Barragem de links encurtados
  - Tentativa de troca de link postado de usuário por link afiliado

# TODO
- Validations
- Impressionist
- Editar comentários
- Popovers to help user (bootstrap)
- Collapse to show more options
- Know someone who can answer? Share a link to this question via email, Google+, Twitter, or Facebook.

# Dependencias
  Ruby 2.3.0
  Postgres 9.X

# Comandos Uteis

  bundle exec passenger start // starta o servidor utilizando o passenger [RECOMENDADO]
  rails console   // Start the Rails console (short-cut alias: "c")

  rake db:create  // Cria o banco de dados especificado em 'config/database.yml'
  rake db:migrate // Aplica a migracao criada
  rake db:seed    // Aplica o arquivo 'db/seeds.rb' utilizado para popular dados

  rails new                   // Create a new Rails application. "rails new my_app" creates a new application called MyApp in "./my_app"    
  rails generate              // Generate new code (short-cut alias: "g")
                  assets      // css, js
                  controller
                  job
                  mailer
                  migration   // modificacão na estrutura do banco de dados
                  model       // modelo (geralmente reflete tabela do banco)
                  resource
                  scaffold    // gera tudo, controller, model, migracao e views etc...
  rails server    // Start the Rails server (short-cut alias: "s")

# To Remember
pluralize palavras.size, 'palavra' => 'palavras'
