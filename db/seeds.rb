NoSessionUser.create!(name:  "Example User",
                       profile_url: "https://pixabay.com/static/uploads/photo/2013/07/13/13/49/onion-161611_960_720.png")

10.times do |n|
  name  = Faker::Name.name
  profile_url = "http://example-#{n+1}.jp"
  NoSessionUser.create!(name:  name,
               profile_url: profile_url)
end

@users = NoSessionUser.order(:created_at).take(3)
20.times do
  message = Faker::Lorem.sentence(5)
  @users.each { |user| NoSessionTalk.create!(message: message,
                                 no_session_user_id: @user.id)}
end
