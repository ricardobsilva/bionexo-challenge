class CreateBasicHealthUnits < ActiveRecord::Migration[5.2]
  def change
    create_table :basic_health_units do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :phone
      t.float :lat
      t.float :long
      t.integer :size
      t.integer :adaptation_for_seniors
      t.integer :medical_equipment
      t.integer :medicine

      t.timestamps
    end
  end
end
