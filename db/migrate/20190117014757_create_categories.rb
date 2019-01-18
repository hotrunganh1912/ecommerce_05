class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :parent_id

      t.datetime "created_at",default: Time.now, null: false
      t.datetime "updated_at"
    end
  end
end
