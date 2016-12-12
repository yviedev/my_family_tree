class User < ApplicationRecord
  has_many :status_updates
  has_many :media
  has_many :relationships

  belongs_to :group, optional: true

  def relative_info

  end

  def full_name
    return "#{first_name} #{last_name}"
  end
  
end
