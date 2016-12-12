class Image < ApplicationRecord
  belongs_to :medium, optional: true
end
