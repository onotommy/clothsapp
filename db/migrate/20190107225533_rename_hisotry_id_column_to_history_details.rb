class RenameHisotryIdColumnToHistoryDetails < ActiveRecord::Migration[5.2]
  def change
    rename_column :history_details, :hisotry_id, :history_id
    
  end
end
