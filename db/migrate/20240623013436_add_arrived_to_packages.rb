class AddArrivedToPackages < ActiveRecord::Migration[7.0]
  def change
    add_column :packages, :arrived, :boolean
  end
end
