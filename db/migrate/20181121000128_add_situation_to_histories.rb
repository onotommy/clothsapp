class AddSituationToHistories < ActiveRecord::Migration[5.2]
  def change
    add_column :histories, :situation, :string
  end
end
