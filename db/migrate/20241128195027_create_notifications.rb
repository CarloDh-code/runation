class CreateNotifications < ActiveRecord::Migration[7.1]
  def change
    create_table :notifications do |t|
      t.string :title, null: false
      t.text :content
      t.boolean :read, default: false
      t.references :player, foreign_key: true, null: false

      t.timestamps
    end
  end
end
