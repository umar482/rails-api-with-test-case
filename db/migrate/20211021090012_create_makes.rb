class CreateMakes < ActiveRecord::Migration[6.1]
  def change
    create_table :makes do |t|
      t.string :name, unique: true
      t.timestamps
    end
  end
end
