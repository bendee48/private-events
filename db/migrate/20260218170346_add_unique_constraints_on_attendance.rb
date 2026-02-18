class AddUniqueConstraintsOnAttendance < ActiveRecord::Migration[8.1]
  def change
    add_index :attendances, [ :event_id, :user_id ], unique: true
  end
end
