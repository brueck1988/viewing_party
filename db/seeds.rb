# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Friendship.destroy_all
User.destroy_all

user1 = User.create(email: "john@appleseed.com", password: "12345" )
user2 = User.create(email: "george@appleseed.com", password: "21345" )
user3 = User.create(email: "jacob@appleseed.com", password: "31245" )
user4 = User.create(email: "jill@appleseed.com", password: "41235" )
user5 = User.create(email: "jamison@appleseed.com", password: "letters" )
user6 = User.create(email: "jose@appleseed.com", password: "steller" )

Friendship.create(accepted: user1, requested: user2)
Friendship.create(accepted: user5, requested: user6)
