class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items, dependent: :destroy
  has_many :items, through: :order_items

  accepts_nested_attributes_for :order_items

  before_save :calculate_total_price
  after_update :send_notification, if: :saved_change_to_status?

  def calculate_total_price
    self.total_price = order_items.sum(&:subtotal)
  end

  def send_notification
    Notification.create!(
      customer: customer,
      order: self,
      message: "Your order is now #{status}!",
      status: "unread"
    )
  end
end
