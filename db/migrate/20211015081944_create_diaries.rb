class CreateDiaries < ActiveRecord::Migration[5.2]
  def change
    create_table :diaries do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.string :image
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
