class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.string :name, default: "", null: false
      t.date :birth_date, default: "", null: false
      t.string :icon
      t.string :mail, default: "", null: false
      t.string :address, default: "", null: false
      t.string :tel, default: "", null: false
      t.integer :allergy, default: 0, null: false
      t.boolean :admin, default: 0, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
