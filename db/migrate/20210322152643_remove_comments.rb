# class RemoveComments < ActiveRecord::Migration[6.0]
#   def change
#     drop_table(:comments, if_exists: true)
#   end
# end

class RemoveComments < ActiveRecord::Migration[6.0]
  def down
    drop_table(:comments, if_exists: true)
  end
end
