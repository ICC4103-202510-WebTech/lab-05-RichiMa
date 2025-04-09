# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.create(email: "agustin@gmail.com", first_name: "Agustin", last_name: "Salzar")
User.create(email: "bartolomeo@gmail.com", first_name: "Bartolomeo", last_name: "Alonso")
User.create(email: "carlos@gmail.com", first_name: "Carlos", last_name: "Gallardo")
User.create(email: "daniel@gmail.com", first_name: "Daniel", last_name: "Guerra")
User.create(email: "efastios@gmail.com", first_name: "Efastios", last_name: "Laso")
User.create(email: "fabricio@gmail.com", first_name: "Fabricio", last_name: "Madariaga")
User.create(email: "gabriel@gmail.com", first_name: "Gabriel", last_name: "Pumarino")
User.create(email: "hector@gmail.com", first_name: "Hector", last_name: "Hermosilla")
User.create(email: "isabel@gmail.com", first_name: "Isabel", last_name: "Tapia")
User.create(email: "javier@gmail.com", first_name: "Javier", last_name: "Montalva")


Chat.create(sender_id: 11, receiver_id: 21)
Chat.create(sender_id: 12, receiver_id: 22)
Chat.create(sender_id: 13, receiver_id: 23)
Chat.create(sender_id: 14, receiver_id: 24)
Chat.create(sender_id: 15, receiver_id: 25)
Chat.create(sender_id: 16, receiver_id: 26)
Chat.create(sender_id: 17, receiver_id: 27)
Chat.create(sender_id: 18, receiver_id: 28)
Chat.create(sender_id: 19, receiver_id: 29)
Chat.create(sender_id: 110, receiver_id: 210)


Message.create(chat_id: 31, user_id: 41, body: "Buenos dias")
Message.create(chat_id: 32, user_id: 42, body: "Buenas tardes")
Message.create(chat_id: 33, user_id: 43, body: "Buenas noches")
Message.create(chat_id: 34, user_id: 44, body: "Como les va familia")
Message.create(chat_id: 35, user_id: 45, body: "Hijo chocaste el auto??")
Message.create(chat_id: 36, user_id: 46, body: "Cabros me funaron...")
Message.create(chat_id: 37, user_id: 47, body: "Grande miguelito")
Message.create(chat_id: 38, user_id: 48, body: "Viva el pisco")
Message.create(chat_id: 39, user_id: 49, body: "Viva el jagger")
Message.create(chat_id: 310, user_id: 410, body: "Viva el gopete y la bibia")

