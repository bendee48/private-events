class AddStatusToAttendance < ActiveRecord::Migration[8.1]
  def change
    add_column :attendances, :status, :string, null: false, default: 'not going'
  end
end
