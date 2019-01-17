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
      t.string :price_in
      t.string :price_out
      t.string :price_sale
      t.integer :status, default: 0, null: false
      t.boolean :new
      t.integer :quantity
      t.boolean :trend

      t.timestamps
    end
  end
end
