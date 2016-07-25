# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

attributes = %w(あいきょう すぎの いしい).map { |name| { name: name } }
users = User.create!(attributes)

binding.pry;
room = Room.create!(name: 'Rails5勉強するマンの集い', user_ids: users.map(&:id))

%w(
きょうは楽しいRails勉強会！
ActionCableってなんじゃいな！
ウホッウホッ
).each do |message|
  Message.create!(title: 'title', content: message, user: users.sample, room: room)
end
