class Cuepoint < ApplicationRecord
  has_many :campaign_cuepoints
  has_many :results
  
  has_many :campaigns, through: :campaign_cuepoints, source: :campaign
  
  has_many :cues, through: :campaign_cuepoints, source: :cuepoint
end
