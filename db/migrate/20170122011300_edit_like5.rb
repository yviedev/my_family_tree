class EditLike5 < ActiveRecord::Migration[5.0]
  def change
    change_column :likes, :vote, :boolean, :default => false
  end
end
