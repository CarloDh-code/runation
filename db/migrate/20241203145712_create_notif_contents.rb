class CreateNotifContents < ActiveRecord::Migration[7.1]
  def change
    create_table :notif_contents do |t|
      t.references :notification, null: false, foreign_key: true

      t.timestamps
    end
  end
end
