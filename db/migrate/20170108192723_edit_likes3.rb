class EditLikes3 < ActiveRecord::Migration[5.0]
  def change
    remove_column :likes, :vote, :integer
    add_column :likes, :vote, :boolean, :default => false
    add_column :likes, :user_id, :integer
  end
end
