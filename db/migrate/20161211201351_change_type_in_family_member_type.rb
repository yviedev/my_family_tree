class ChangeTypeInFamilyMemberType < ActiveRecord::Migration[5.0]
  def change
    rename_column :family_member_types, :type, :name
  end
end
