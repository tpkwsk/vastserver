(1..100).each do |number|
  Campaign.create(name: "test" + number.to_s,
  start_at: DateTime.now + number,
  end_at: DateTime.now + number + 1,
  limit_start: number.to_s,
  movie_url: "test" + number.to_s + ".com",
  cuepoint1: true,
  cuepoint2: true,
  cuepoint3: true,
  cuepoint4: true,
  cuepoint5: true)
  Cuepoint.create(name: "test" + number.to_s)
end