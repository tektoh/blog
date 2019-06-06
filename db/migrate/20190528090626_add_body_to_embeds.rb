class AddBodyToEmbeds < ActiveRecord::Migration[5.2]
  def change
    change_table :embeds do |t|
      t.text :body
    end
  end
end
