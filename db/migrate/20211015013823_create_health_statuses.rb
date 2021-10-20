class CreateHealthStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :health_statuses do |t|
      t.integer :systolic, null: false
      t.integer :diastolic, null: false
      t.integer :pulse, null: false
      t.text :condition, default: "", null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
