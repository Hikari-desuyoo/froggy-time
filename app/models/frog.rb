class Frog < ApplicationRecord
  def self.average_age
    Frog.average(:age)
  end

  def above_or_below_age_average
    average = self.class.average_age
    return 'Acima' if age > average
    return 'Abaixo' if age < average

    'Igual'
  end
end
