class Cat < ApplicationRecord
    validates :name, presence: true, null: false
    validates :color, null: false, inclusion: { in: CAT_COLORS, message: "is not a valid color" }
    validates :sex, null: false, inclusion: { in ["M", "F"], message: "must be 'M' or 'F'" }
    CAT_COLORS = ["Black", "White", "Gray", "Orange", "Calico"].freeze
    validates :description, presence: true
    validates :timestamps, presence: true

    def birth_date_cannot_be_future
        if birth_date.present? && birth_date > Date.today
            errors.add(:birth_date, "can't be in the future")
        end
    end

    validate :birth_date_cannot_be_future

    To calculate the age of a cat based on its birth_date in a Ruby on Rails model, you can define an #age method. Here's an example of how you can implement this method in your Cat model:

ruby

class Cat < ApplicationRecord
  # Other model code...

  # Calculate the age based on birth_date
  def age

    # Calculate the age by subtracting the birth_date from today's date
    today = Date.today
    age_in_years = today.year - birth_date.year - (today.yday < birth_date.yday ? 1 : 0)

    # You can also optionally include months and days for a more detailed age calculation
    age_in_months = today.month - birth_date.month
    age_in_days = today.day - birth_date.day

    # Return a formatted age string (years, months, and days)
    if age_in_years > 0
      "#{age_in_years} years, #{age_in_months} months, #{age_in_days} days"
    elsif age_in_months > 0
      "#{age_in_months} months, #{age_in_days} days"
    else
      "#{age_in_days} days"
    end
  end

end
