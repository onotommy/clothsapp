class CreateHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :histories do |t|
      t.date :wore_data
      t.text :memo
      t.string :main_image
      t.integer :user_id

      t.timestamps
    end
  end
end
