(1..10).each do |number|
  Campaign.create(name: "test" + number.to_s,
  start_at: DateTime.now + number,
  end_at: DateTime.now + number + 1,
  limit_start: number.to_s,
  movie_url: "testcanp" + number.to_s + ".com")
  Cuepoint.create(name: "testcue" + number.to_s)
  # CampaignCuepoint.create(campaign_id: number, cuepoint_id: number)
end