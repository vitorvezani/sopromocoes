class Category < ActiveRecord::Base
  extend FriendlyId

  has_many :subcategories, class_name: "Category", foreign_key: "parent_id", dependent: :destroy
  belongs_to :parent, class_name: "Category"

  friendly_id :name, use: :slugged
end
