class CreateSentences < ActiveRecord::Migration[5.2]
  def change
    create_table :sentences do |t|
      t.string :headline
      t.text :body
      t.timestamps
    end
  end
end
