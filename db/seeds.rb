# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Todo.create!(user_id: 10,
    titleStr: "go to play camp",
    todoText: "at 12, this is \n .. time to be away from this world .. ",
    IsNotify: "1",
    IsMemo: "0",
    lookUpTimeStr: "10/12 2016",
    notificationTimeStr: "12/12 2016",
    todoTimeStr: "10/12 2016")