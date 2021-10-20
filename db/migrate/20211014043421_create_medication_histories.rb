class CreateMedicationHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :medication_histories do |t|
      t.string :name, null: false
      t.integer :usage, default: 0, null: false
      t.date :prescription_on
      t.text :note, default: "", null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
