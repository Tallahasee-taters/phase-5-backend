User.destroy_all
VideoPost.destroy_all
Friendship.destroy_all

u = User.create(email: "hi@gmail.com", username: "Gamer")
u2 = User.create(email: "fake@gmail.com", username: "Player")
u3 = User.create(email: "test@gmail.com", username: "Noob")


VideoPost.create(header: "Crazy Gameplay", user_id: u)
VideoPost.create(header: "Love how pretty this game is", user_id: u)
VideoPost.create(header: "Look At this!", user_id: u2)
VideoPost.create(header: "Wild", user_id: u2)
VideoPost.create(header: "super cool!", user_id: u2)
VideoPost.create(header: "going to be playing this for years", user_id: u3)

Friendship.create(sender_id: u, reciever_id: u2)
Friendship.create(sender_id: u, reciever_id: u3)
Friendship.create(sender_id: u2, reciever_id: u3)

puts "seeding done!"