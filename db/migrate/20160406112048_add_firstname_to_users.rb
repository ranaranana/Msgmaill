class AddFirstnameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :firstname, :string
    add_column :Users , :lastname, :string
    add_column :users, :role, :string
    add_column :users, :brithday, :date
  end
end
