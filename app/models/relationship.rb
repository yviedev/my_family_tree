class Relationship < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :relative, class_name: User, optional: true
  belongs_to :relative_type, optional: true

  

end
