class User < ApplicationRecord
  has_secure_password

  has_many :status_updates
  has_many :media
  has_many :relationships

  belongs_to :group, optional: true

  def relative_info

  end

  def full_name
    return "#{first_name} #{last_name}"
  end

  def pretty_time(date)
    if date
      date.strftime("%B %-d")
    else
      "#{first_name} doesn't have one."
    end
  end

  def relation
  end

end
