# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do |n|
  User.create!(
    email: "test#{n}@test.com",
    name: "テスト太郎#{n}",
    password: "test"
  )
end

5.times do |n|
  Content.create!(
    title: "テスト#{n}",
    url: "テスト#{n}",
    memo: "test#{n}",
    user_id: "1"
  )
end
