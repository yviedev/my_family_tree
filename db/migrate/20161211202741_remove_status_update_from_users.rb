class RemoveStatusUpdateFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :status_update_id
  end
end
