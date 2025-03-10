class CreateDiscounts < ActiveRecord::Migration[7.1]
  def change
    create_table :discounts do |t|
      t.string :discount_type
      t.decimal :value
      t.references :applies_to_item, null: true, foreign_key: { to_table: :items }

      t.timestamps
    end
  end
end
