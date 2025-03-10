class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item

  before_save :apply_discount

  def apply_discount
    if item.discount.present?
      case item.discount.discount_type
      when "percentage"
        self.applied_discount = (item.price * item.discount.value / 100)
      when "fixed_amount"
        self.applied_discount = item.discount.value
      when "bogo"  # Buy One Get One: 50% off for 2 or more
        self.applied_discount = (item.price * 0.5) if quantity >= 2
      end
    end
  end

  def subtotal
    (item.price * quantity) - (applied_discount || 0)
  end
end
