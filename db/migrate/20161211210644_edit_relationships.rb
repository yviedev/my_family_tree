class EditRelationships < ActiveRecord::Migration[5.0]
  def change
    remove_column :relationships, :related_as_id
    remove_column :relationships, :relative_id
    add_column :relationships, :family_member_id, :integer
    add_column :relationships, :family_member_type_id, :integer
  end
end
