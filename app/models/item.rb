class Item < ApplicationRecord
  has_one :discount, foreign_key: "applies_to_item_id", dependent: :destroy
  has_many :order_items
  has_many :orders, through: :order_items
end
