# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user_one = User.create!
user_two = User.create!

conversation = Conversation.create!(sender_id: user_one.id, receiver_id: user_two.id)

Message.create!(conversation_id: conversation.id, text: 'Howdy there')
Message.create!(conversation_id: conversation.id, text: 'Hidey hidey hidey ho')
