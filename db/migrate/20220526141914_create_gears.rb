class CreateGears < ActiveRecord::Migration[6.1]
  def change
    create_table :gears do |t|
      t.string :name
      t.float :offset_value

      t.timestamps
    end
  end
end
