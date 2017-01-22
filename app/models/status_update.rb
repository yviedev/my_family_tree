class StatusUpdate < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :comments

  def month_date_year(date)
    if date
      date.strftime("%B %-d, %Y")
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
