# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
  email: "abc@gmail.com",
  name: "NoA_okku",
  password: "abc" ,
  qiita_token: "9fdbb47aae1dc4b7871e87ac35df8fbe9ed3affb"
)
