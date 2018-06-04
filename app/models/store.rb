class Store < ApplicationRecord
  before_save :set_validity

  def set_validity
    self.validity = Time.now + 5.minutes
  end
end
