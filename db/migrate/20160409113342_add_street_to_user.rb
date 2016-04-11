class AddStreetToUser < ActiveRecord::Migration
  def change
    add_column :users, :street, :string
    add_column :users, :city ,:string
    add_column :users, :state ,:string
    add_column :users, :country, :string
    add_column :users, :zipcode , :integer
    add_column :users, :image , :string
   
  end
end

  