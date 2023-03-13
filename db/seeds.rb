response = HTTParty.get('https://store.steampowered.com/api/trailerslideshow/?cc=us&l=english')
videos = response["movies"]

u = User.new(username: "ConaldPeterson", email: "game@gmail.com", password: "password" )
u.avatar.attach(io: File.open('storage/neewahhayla71.webp'), filename: 'neewahhayla71.webp')
u.save

videos.map do |v|  
    Video.create(title: v['name'] , video_url: v['webm']['480'], user: u)
 end

 pick_random_video = Video.all.sample 

# User.destroy_all
# Post.destroy_all

# u = User.create(username: "ConaldPeterson", email: "game@gmail.com", password: "password")
# u2 = User.create(username: "gamer", email: "hi@gmail.com", password: "password1")
# u3 = User.create(username: "test", email: "test@gmail.com", password: "password2")


# Video.create(title: "WOW", video_url: , upvote: 325, downvote: 92, user: u)
# Video.create(title: "Check this out", video_url: , upvote: 412, downvote: 28, user: u)
# Video.create(title: "Oops", video_url: , upvote: 635, downvote: 38, user: u)
# Video.create(title: "slick", video_url: , upvote: 192, downvote: 93, user: u)
# Video.create(title: "sooooo cool!", video_url: , upvote: 263, downvote: 9, user: u2)
# Video.create(title: "5 minutes of hogwarts", video_url: , upvote: 103, downvote: 0, user: u2)
# Video.create(title: "oh boy...", video_url: , upvote: 183, downvote: 21, user: u2)
# Video.create(title: "graphics are unreal", video_url: , upvote: 463, downvote: 34, user: u3)
# Video.create(title: "woah!", video_url: , upvote: 284, downvote: 14, user: u3)

puts "seeding done!"