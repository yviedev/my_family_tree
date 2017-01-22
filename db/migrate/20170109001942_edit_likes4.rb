class EditLikes4 < ActiveRecord::Migration[5.0]
  def change
    change_column :likes, :vote, :boolean, :default => true
  end
end
