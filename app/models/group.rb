class Group < ApplicationRecord
  has_many :users
  has_many :status_updates, through: :users
end
