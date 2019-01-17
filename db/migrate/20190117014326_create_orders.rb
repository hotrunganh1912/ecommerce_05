class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :users_id
      t.float :total_price
      t.integer :status, default: 0, null: false
      t.integer :close_at

      t.timestamps
    end
  end
end
