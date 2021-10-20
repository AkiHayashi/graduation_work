class CreatePharmacies < ActiveRecord::Migration[5.2]
  def change
    create_table :pharmacies do |t|
      t.string :name, null: false
      t.string :address, default: "", null: false
      t.string :tel, default: "", null: false
      t.references :medication_history, foreign_key: true
      t.timestamps
    end
  end
end
