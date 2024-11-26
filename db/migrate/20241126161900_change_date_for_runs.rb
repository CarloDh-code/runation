class ChangeDateForRuns < ActiveRecord::Migration[7.1]
  def change
    change_column :runs, :start_date, :datetime
    change_column :runs, :end_date, :datetime

    rename_column :runs, :start_date, :start_datetime
    rename_column :runs, :end_date, :end_datetime
  end
end
