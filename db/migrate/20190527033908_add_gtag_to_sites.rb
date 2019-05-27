class AddGtagToSites < ActiveRecord::Migration[5.2]
  def change
    change_table :sites do |t|
      t.text :gtag
    end
  end
end
