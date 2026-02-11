class AddUsernameToUsers < ActiveRecord::Migration[8.1]
  def up
    add_column :users, :username, :string
    add_index :users, :username, unique: true

    User.reset_column_information
    User.find_each do |user|
      user.update_columns(username: "user#{user.id}")
    end

    change_column_null :users, :username, false
  end

  def down
    remove_column :users, :username
  end
end
