class StatusUpdate < ApplicationRecord
  belongs_to :user

  def month_date_year(date)
    if date
      date.strftime("%B %-d, %Y")
    else
      "#{first_name} doesn't have one."
    end
  end

end
