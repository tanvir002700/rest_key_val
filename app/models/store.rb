class Store < ApplicationRecord
  before_save :set_validity

  validates :key, presence: true
  validates :key, uniqueness: true

  def set_validity
    self.validity = Time.now + 5.minutes
  end
end
