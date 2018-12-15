class CreateCloths < ActiveRecord::Migration[5.2]
  def change
    create_table :cloths do |t|
      t.string :size
      t.string :category
      t.string :color
      t.string :brand
      t.string :cloths_image
      t.string :memo

      t.timestamps
    end
  end
end
