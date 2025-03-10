# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# db/seeds.rb

# Create some customers
customer1 = Customer.create!(name: "Alice", email: "alice@example.com", membership: true)
customer2 = Customer.create!(name: "Bob", email: "bob@example.com", membership: false)

# Create some items
item1 = Item.create!(name: "Ruby on Rails Book", category: "Book", price: 30.0, availability: "in-stock")
item2 = Item.create!(name: "Tech Magazine", category: "Magazine", price: 10.0, availability: "in-stock")
item3 = Item.create!(name: "Stationery Set", category: "Stationery", price: 15.0, availability: "pre-order")

# Create a discount for an item
discount = Discount.create!(discount_type: "percentage", value: 20, applies_to_item: item1)

# Create an order for a customer and add order items (using nested attributes)
order = Order.create!(
  customer: customer1,
  status: "pending",
  order_items_attributes: [
    { item_id: item1.id, quantity: 2 },
    { item_id: item2.id, quantity: 1 }
  ]
)

# Output to confirm data creation in the logs
puts "Seed data successfully created!"

