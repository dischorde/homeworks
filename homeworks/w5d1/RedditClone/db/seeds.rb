# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(username: "katarina", password: "abc123")
User.create(username: "maria", password: "password")

Sub.create(title: "All the Cats!", description: "Meow Meow", user_id: 1)
Sub.create(title: "All the Dogs!", description: "Woof Woof", user_id: 2)
Sub.create(title: "All the Horses!", description: "NEIGH", user_id: 1)

Post.create(title: "Sasha", content: "A big fat snausage cat", user_id: 1)
Post.create(title: "Berkeley", content: "BERKLECOPTER", user_id: 1)
Post.create(title: "Willis", content: "GIVE ME ALL THE ATTENTION", user_id: 2)
Post.create(title: "Sylvester", content: "Wooosh", user_id: 1)
Post.create(title: "CatDog", content: "WoofMEow", user_id: 2)
Post.create(title: "DogHorse", content: "Woof CLUNK", user_id: 2)

PostSub.create(post_id: 1, sub_id: 1)
PostSub.create(post_id: 2, sub_id: 2)
PostSub.create(post_id: 3, sub_id: 2)
PostSub.create(post_id: 4, sub_id: 3)
PostSub.create(post_id: 5, sub_id: 1)
PostSub.create(post_id: 5, sub_id: 2)
PostSub.create(post_id: 6, sub_id: 2)
PostSub.create(post_id: 6, sub_id: 3)
