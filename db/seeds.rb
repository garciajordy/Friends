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
con = Conversation.create(user_id: 1,other_user_id:2)
con2 = Conversation.create(user_id: 1,other_user_id:3)
con3 = Conversation.create(user_id: 1,other_user_id:4)
con3.messages.create(send_user_id: 4,receive_user_id: 1, text: "Hi jordy")
con2.messages.create(send_user_id: 3,receive_user_id: 1, text: "Coool app jordy")
con2.messages.create(send_user_id: 1,receive_user_id: 3, text: "Thanks Orlin")
con2.messages.create(send_user_id: 3,receive_user_id: 1, text: "How are you doing jordy?")
con.messages.create(send_user_id: 2,receive_user_id: 1, text: "Coool app jordy")
con.messages.create(send_user_id: 1,receive_user_id: 2, text: "Thanks polly")
con.messages.create(send_user_id: 2,receive_user_id: 1, text: "How are you doing jordy?")
con.messages.create(send_user_id: 1,receive_user_id: 2, text: "Im great, Thanks for asking polly")
# Message.create(send_user_id: 1,receive_user_id: 2, text: "Coool app buddy")
# Message.create(send_user_id: 2,receive_user_id: 1, text: "Thanks man")