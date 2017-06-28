class Campaign < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: { maximum: 20, minimum: 5 }
end
