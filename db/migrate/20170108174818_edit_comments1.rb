class EditComments1 < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :status_update_id, :integer
  end
end
