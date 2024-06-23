class CreatePackages < ActiveRecord::Migration[7.0]
  def change
    create_table :packages do |t|
      t.string :description
      t.date :arrival_date
      t.string :details

      t.timestamps
    end
  end
end
