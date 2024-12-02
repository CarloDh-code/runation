class AddNameToRuns < ActiveRecord::Migration[7.1]
  def change
    add_column :runs, :name, :string
  end
end
