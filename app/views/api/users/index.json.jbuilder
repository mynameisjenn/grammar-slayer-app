json.array! @users.each do |user|
  json.id user.id
  json.username user.username
  json.name user.name
  json.city user.city
  json.state user.state
  json.age user.age
  json.mini_bio user.mini_bio
end