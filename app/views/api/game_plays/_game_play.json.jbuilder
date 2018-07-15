json.id game_play.id
json.user_id game_play.user_id
json.score game_play.score
json.level game_play.level

json.user do
  json.partial! game_play.user, partial: "api/users/user", as: :user
end

