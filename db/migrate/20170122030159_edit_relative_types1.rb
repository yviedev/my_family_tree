class EditRelativeTypes1 < ActiveRecord::Migration[5.0]
  def change
    add_column :relative_types, :inverse_name, :string
  end
end
