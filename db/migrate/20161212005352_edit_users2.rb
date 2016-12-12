class EditUsers2 < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :birthday, :date
    add_column :users, :anniversary, :date
  end
end
