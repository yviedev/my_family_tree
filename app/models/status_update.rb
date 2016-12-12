class StatusUpdate < ApplicationRecord
  belongs_to :user, optional: true 
end
