class CreatePharmacies < ActiveRecord::Migration[5.2]
  def change
    create_table :pharmacies do |t|
      t.string :name
      t.string :address
      t.string :tel
      t.references :medication_history, foreign_key: true
      t.timestamps
    end
  end
end
