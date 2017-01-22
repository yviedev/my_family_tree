class Comment < ApplicationRecord
  belongs_to :status_update
  belongs_to :user
end
