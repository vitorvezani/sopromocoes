class User < ActiveRecord::Base
  extend FriendlyId

  acts_as_voter

  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :omniauthable, omniauth_providers: [:facebook]

  has_many :promotions, dependent: :destroy
  has_many :coupons, dependent: :destroy

  friendly_id :username, use: :slugged

  validates :email, confirmation: true
  validates :password, confirmation: true

  validates :username, length: { minimum: 6 }, uniqueness: true, presence: true

  def self.from_omniauth_facebook(auth)
    where(provider_facebook: auth.provider, uid_facebook: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20] if user.password.nil?
      user.name = auth.info.name
      user.image_url = auth.info.image
    end
  end

  def name_or_username
    name or username
  end

  def image
    image_url or gravatar_url
  end

  private

    # Gravatar
    def gravatar_url
      # include MD5 gem, should be part of standard ruby install
      require 'digest/md5'

      email_address = self.email.downcase
      hash = Digest::MD5.hexdigest(email_address)
      "http://www.gravatar.com/avatar/#{hash}"
    end

end
