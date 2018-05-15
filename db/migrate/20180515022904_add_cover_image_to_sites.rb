class AddCoverImageToSites < ActiveRecord::Migration[5.2]
  def change
    add_column :sites, :cover_image, :string
  end
end
