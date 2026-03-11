class AddVisibilityToEvents < ActiveRecord::Migration[8.1]
  def change
    add_column :events, :visibility, :integer, null: false, default: 0
  end
end
