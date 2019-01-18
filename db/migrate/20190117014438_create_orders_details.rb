class CreateOrdersDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :orders_details do |t|
      t.integer :order_id
      t.integer :product_id
      t.float :price
      t.integer :quantity

      t.datetime "created_at",default: Time.now, null: false
      t.datetime "updated_at"
    end
  end
end
