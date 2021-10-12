class CreateMedicalHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :medical_histories do |t|
      t.string :name
      t.date :start_on
      t.string :surgery, default: "", null: false
      t.date :surgery_on
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
