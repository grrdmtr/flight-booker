class ChangeDataTypeForStartDate < ActiveRecord::Migration[7.0]
  def change
    change_column :flights, :start_date, :date
  end
end
