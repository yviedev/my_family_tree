class Comment < ApplicationRecord
  belongs_to :status_update, optional: true
end
