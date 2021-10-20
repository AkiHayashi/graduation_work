class AddIndexToAccounts < ActiveRecord::Migration[5.2]
  def change
    add_index :accounts, :mail, unique: true
  end
end
