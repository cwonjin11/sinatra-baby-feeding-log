users = [
    {username: "pickleboy", email: "pickles@duh.com", password: "pickles"},
    {username: "winston22", email: "puppydog@fetch.com", password: "tail_wagger"},
    {username: "climbing_gurl", email: "climbing_gurl@gmail.com", password: "hiker4lyfe"}
    ]
    
    
    users.each do |user|
      User.create(user)
    end