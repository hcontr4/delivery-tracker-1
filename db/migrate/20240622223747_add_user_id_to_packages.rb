class AddUserIdToPackages < ActiveRecord::Migration[7.0]
  def change
    add_column :packages, :user_id, :integer
  end
end
