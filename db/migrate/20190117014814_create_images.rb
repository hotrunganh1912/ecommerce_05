class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :name
      t.integer :products_id

      t.datetime "created_at",default: Time.now, null: false
      t.datetime "updated_at"
    end
  end
end
