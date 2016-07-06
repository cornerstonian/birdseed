require 'faker'


User.delete_all
Post.delete_all

25.times do |i|
  User.create username: "#{Faker::Internet.user_name}", password: "test"
end

25.times do |i|
  Post.create user_id: "#{i+1}", body: "#{Faker::Hipster.paragraph(1)}"
end
