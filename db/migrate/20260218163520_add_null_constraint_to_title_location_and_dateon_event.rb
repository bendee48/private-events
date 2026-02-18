class AddNullConstraintToTitleLocationAndDateonEvent < ActiveRecord::Migration[8.1]
  def change
    change_column_null :events, :title, false
    change_column_null :events, :location, false
    change_column_null :events, :date, false
  end
end
