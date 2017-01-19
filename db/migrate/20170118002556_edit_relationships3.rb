class EditRelationships3 < ActiveRecord::Migration[5.0]
  def change
    add_column :relationships, :group_id, :integer
  end
end
