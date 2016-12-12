class UpdateFamilyMember < ActiveRecord::Migration[5.0]
  def change
    remove_column :family_members, :type
    add_column :family_members, :user_id, :integer
  end
end
