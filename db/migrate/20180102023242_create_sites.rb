class CreateSites < ActiveRecord::Migration[5.1]
  def change
    create_table :sites do |t|
      t.string :name
      t.string :subtitle
      t.string :og_image
      t.string :favicon
      t.text :description
      t.timestamps
    end
  end
end
