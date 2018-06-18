json.array! @game_plays.each do |game_play|
  json.id game_play.id
  json.user_id game_play.user_id
  json.score game_play.score
  json.level game_play.level
end

