class RemoveMesToMessage < ActiveRecord::Migration
  def change
    remove_column :messages, :atta, :string
      end
end
