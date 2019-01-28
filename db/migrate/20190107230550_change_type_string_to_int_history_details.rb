class ChangeTypeStringToIntHistoryDetails < ActiveRecord::Migration[5.2]
  def change
    change_column :history_details, :cloth_id, :integer
  end
end
