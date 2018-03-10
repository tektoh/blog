class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :crypted_password
      t.string :avatar
      t.integer :role, default: 0
      t.timestamps
      t.datetime :deleted_at

      t.index :name
      t.index :deleted_at
    end
  end
end
