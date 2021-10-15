class CreateHealthStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :health_statuses do |t|
      t.integer :systolic
      t.integer :diastolic
      t.integer :pulse
      t.text :condition, default: "", null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
