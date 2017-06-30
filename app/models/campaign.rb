class Campaign < ApplicationRecord
  
  validates :name, presence: true, uniqueness: true, length: { maximum: 20, minimum: 5 }
  validates :start_at, presence: true
  validates :end_at, presence: true
  validate :start_and_end
  validates :limit_start, presence: true, numericality: { only_integer: true }, length: { maximum: 10000, minimum: 0 }
  validates :movie_url, presence: true, length: { maximum: 100, minimum: 5 }
  
  def start_and_end
    if start_at.present? && start_at > end_at
      errors.add(:start_at, "start_at must be smaller than end_at")
    end
  end
  
end
