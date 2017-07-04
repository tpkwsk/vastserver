class Campaign < ApplicationRecord
  
  validates :name, presence: true, uniqueness: true, length: { maximum: 20, minimum: 5 }
  validates :start_at, presence: true
  validates :end_at, presence: true
  validate :start_and_end
  validates :limit_start, presence: true, numericality: { only_integer: true }, length: { maximum: 10000, minimum: 0 }
  validates :movie_url, presence: true, length: { maximum: 100, minimum: 5 }
  
  has_many :campaign_cuepoints
  has_many :cues , through: :campaign_cuepoints, source: :cuepoint
  # accepts_nested_attributes_for :campaign_cuepoints
  
  def start_and_end
    if start_at.present? && start_at > end_at
      errors.add(:start_at, "start_at must be smaller than end_at")
    end
  end
  
  # def en_cue(cuepoint)
  #   CampaignCuepoint.find_or_create_by(cuepoint_id: cuepoint.id)
  # end

  # def un_cue(cuepoint)
  #   campaign_cuepoint = CampaignCuepoint.find_by(cuepoint_id: cuepoint.id)
  #   campaign_cuepoint.destroy if campaign_cuepoint
  # end
  
end
