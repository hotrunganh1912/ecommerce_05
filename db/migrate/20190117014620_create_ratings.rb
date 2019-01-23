class CreateRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :ratings do |t|
      t.integer :user_id
      t.integer :product_id
      t.integer :value_rate

      t.datetime "created_at",default: Time.now, null: false
      t.datetime "updated_at"
    end
  end
end
