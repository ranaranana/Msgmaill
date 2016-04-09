class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.integer :mobile,:really_big_int, limit: 10
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
