class Discount < ApplicationRecord
  belongs_to :applies_to_item, class_name: 'Item', foreign_key: 'applies_to_item_id', optional: true
end
