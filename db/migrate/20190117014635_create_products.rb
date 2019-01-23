class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :categorie_id
      t.string :name
      t.string :description_sort
      t.text :description_long
      t.string :name_image
      t.string :color
      t.string :size
      t.float :price_in
      t.float :price_sale
      t.float :price_out
      t.integer :status, default: 0, null: false
      t.boolean :new
      t.integer :quantity
      t.boolean :trend, default:false

      t.datetime "created_at",default: Time.now, null: false
      t.datetime "updated_at"
    end
  end
end
