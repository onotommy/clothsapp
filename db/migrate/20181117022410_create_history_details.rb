class CreateHistoryDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :history_details do |t|
      t.integer :hisotry_id
      t.string :cloth_id

      t.timestamps
    end
  end
end
