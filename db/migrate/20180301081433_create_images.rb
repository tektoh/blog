class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.string :file
      t.string :content_type
      t.string :file_size
      t.string :title
      t.integer :width
      t.integer :height
      t.timestamps
    end
  end
end
