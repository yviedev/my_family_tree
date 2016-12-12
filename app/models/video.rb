class Video < ApplicationRecord
  belongs_to :medium, optional: true
end
