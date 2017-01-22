class EditRelationships4 < ActiveRecord::Migration[5.0]
  def change
    add_column :relationships, :inverse_relative_type_id, :integer
  end
end
