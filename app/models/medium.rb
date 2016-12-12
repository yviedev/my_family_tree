class Medium < ApplicationRecord
  has_many :images
  has_many :videos

  belongs_to :user, optional: true
end
