class RemoveFieldNameFromuser < ActiveRecord::Migration
 
  	def up

    remove_column :users, :profile , :string
  end

  def down
    	
  end
  
end
