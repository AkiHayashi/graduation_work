class CreateHospitals < ActiveRecord::Migration[5.2]
  def change
    create_table :hospitals do |t|
      t.string :name
      t.string :address
      t.string :tel
      t.references :medical_history, foreign_key: true
      t.timestamps
    end
  end
end
