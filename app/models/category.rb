class Category < ActiveRecord::Base
  extend FriendlyId

  include PublicActivity::Model
  tracked # owner: Proc.new { |controller, model| controller.default_current_user ? controller.default_current_user : nil }

  has_many :subcategories, class_name: "Category", foreign_key: "parent_id", dependent: :destroy
  belongs_to :parent, class_name: "Category"

  friendly_id :name, use: :slugged
end
