class CreateMediumImages < ActiveRecord::Migration[5.1]
  def change
    create_table :medium_images do |t|
      t.belongs_to :medium
      t.belongs_to :image
      t.timestamps
    end
  end
end
