class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.string :nickname
      t.string :gender
      t.integer :tall
      t.integer :weight

      t.timestamps
    end
  end
end
