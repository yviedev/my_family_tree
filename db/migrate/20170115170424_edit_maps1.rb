class EditMaps1 < ActiveRecord::Migration[5.0]
  def change
    add_column :maps, :description, :string
    add_column :maps, :group_id, :integer
  end
end
