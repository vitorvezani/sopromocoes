class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :promotions, dependent: :destroy


  # Se tiver nome, retorna o nome, se não o email.
	def full_name()
		if self.first_name? and self.last_name? then
			self.first_name + " " + self.last_name
		elsif self.first_name? then
			self.first_name
		else
			self.email
		end
	end
end
