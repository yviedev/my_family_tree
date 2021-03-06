class User < ApplicationRecord
  has_secure_password
  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :status_updates
  has_many :images
  has_many :relationships
  has_many :likes
  has_many :comments

  belongs_to :group, optional: true

  def full_name
    return "#{first_name} #{last_name}"
  end

  def month_date(date)
    if date
      date.strftime("%B %-d")
    else
      "#{first_name} doesn't have one."
    end
  end

  def month_date_year(date)
    if date
      date.strftime("%B %-d, %Y")
    else
      "#{first_name} doesn't have one."
    end
  end

  def year_month_date(date)
    if date
      date.strftime("%Y-%m-%d")
    else
      "#{first_name} doesn't have one."
    end
  end

  def mm_dd_yy(date)
    if date
      date.strftime("%m/%d/%y")
    else
      "#{first_name} doesn't have one."
    end
  end

  def month_date_year_time(date)
    if date
      date.strftime("%B %-d, %Y at %I:%M %P")
    else
      "#{first_name} doesn't have one."
    end
  end

end
