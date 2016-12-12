class DropFamilyMembers < ActiveRecord::Migration[5.0]
  def change
    drop_table :family_members
  end
end
