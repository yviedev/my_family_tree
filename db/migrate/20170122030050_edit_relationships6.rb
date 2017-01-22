class EditRelationships6 < ActiveRecord::Migration[5.0]
  def change
    remove_column :relationships, :inverse_relative_type_id
  end
end
