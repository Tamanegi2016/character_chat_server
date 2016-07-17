NoSessionUser.create!(name:  "Example User",
                       profile_url: "https://pixabay.com/static/uploads/photo/2013/07/13/13/49/onion-161611_960_720.png")

10.times do |n|
  name  = Faker::Name.name
  profile_url = "http://example-#{n+1}.jp"
  NoSessionUser.create!(name:  name,
               profile_url: profile_url)
end

Friend.create!(to_user_id:1,from_user_id:2)
Friend.create!(to_user_id:2,from_user_id:1)


20.times do
  message = Faker::Lorem.sentence(5)
  NoSessionTalk.create!(message: message,friend_id:1,
                                 no_session_user_id: 1)
end

20.times do
  message = Faker::Lorem.sentence(5)
  NoSessionTalk.create!(message: message,friend_id:2,
                                 no_session_user_id: 2)
end
