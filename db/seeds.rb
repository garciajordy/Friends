# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
u = User.create(username: "jordy",email:"jordy@gmail.com",password:"123456")
u2 = User.create(username: "polly",email:"polly@gmail.com",password:"123456")
User.create(username: "orlin",email:"orlin@gmail.com",password:"123456")
User.create(username: "marina",email:"marina@gmail.com",password:"123456")
User.create(username: "violet",email:"violet@gmail.com",password:"123456")
Message.create(send_user_id: 1,receive_user_id: 2, text: "Coool app buddy")
Message.create(send_user_id: 2,receive_user_id: 1, text: "Thanks man")