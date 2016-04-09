class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :to
      t.string :from
      t.string :subject
      t.string :body
      t.string :atta

      t.timestamps null: false
    end
  end
end
