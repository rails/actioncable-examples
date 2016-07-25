class DropComments < ActiveRecord::Migration[5.0]
  def change
    drop_table :comments

    change_table :messages do |t|
      t.references :room, foreign_key: true
    end
  end
end
