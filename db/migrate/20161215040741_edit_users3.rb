class EditUsers3 < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :birthday, :datetime
    change_column :users, :anniversary, :datetime
    add_column :users, :admin, :boolean, default: false
  end
end
