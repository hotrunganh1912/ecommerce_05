class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :address
      t.string :phone
      t.integer :sex
      t.integer :role, null: false, default: 0
      t.string :password_digest
      t.string :remember_digest

      t.datetime "created_at",default: Time.now, null: false
      t.datetime "updated_at"
    end
  end
end
