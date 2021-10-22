class CreateVehicles < ActiveRecord::Migration[6.1]
  def change
    create_table :vehicles do |t|
      t.belongs_to :make, foreign_key: true
      t.string :model
      t.timestamps
    end
  end
end
