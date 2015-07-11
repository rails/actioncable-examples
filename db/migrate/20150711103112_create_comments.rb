class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :message, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.text :content

      t.timestamps
    end
  end
end
