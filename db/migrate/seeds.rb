users = [
    {username: "pickleboy", email: "pickles@duh.com", password: "pickles"},
    {username: "winston22", email: "puppydog@fetch.com", password: "tail_wagger"},
    {username: "climbing_gurl", email: "climbing_gurl@gmail.com", password: "hiker4lyfe"}
    ]
    
    users.each do |user|
      User.create(user)
    end


    babies = [
      {name: "pickleboy", age: "pickles@duh.com"},
      {username: "winston22", email: "puppydog@fetch.com", password: "tail_wagger"},
      {username: "climbing_gurl", email: "climbing_gurl@gmail.com", password: "hiker4lyfe"}
      ]


    schedules = [
        {username: "pickleboy", email: "pickles@duh.com", password: "pickles"},
        {username: "winston22", email: "puppydog@fetch.com", password: "tail_wagger"},
        {username: "climbing_gurl", email: "climbing_gurl@gmail.com", password: "hiker4lyfe"}
        ]
  



    # namespace :db do
    #   desc 'seed the database with some dummy data'
    #   task :seed do
    #     require_relative './db/migrate/seeds.rb'
    #   end
    # end 