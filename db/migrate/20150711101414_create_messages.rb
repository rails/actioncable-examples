class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.references :user, foreign_key: true

      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
