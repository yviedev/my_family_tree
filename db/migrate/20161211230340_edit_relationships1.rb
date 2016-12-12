class EditRelationships1 < ActiveRecord::Migration[5.0]
  def change
    add_column :relationships, :relative_id, :integer
    add_column :relationships, :relative_type_id, :integer
    remove_column :relationships, :family_member_id
    remove_column :relationships, :family_member_type_id
  end
end
