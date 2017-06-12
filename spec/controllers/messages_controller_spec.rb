require 'rails_helper'

RSpec.describe MessagesController, type: :controller do
  describe '#index' do

    before do
      @user_one = User.create!
      @user_two = User.create!
      @conversation = Conversation.create!(sender_id: @user_one.id, receiver_id: @user_two.id)
      @message_one = Message.create!(conversation_id: @conversation.id, text: 'Howdy there')
      @message_two = Message.create!(conversation_id: @conversation.id, text: 'Hidey hidey hidey ho')

      get(:index, params: { conversation_id: @conversation.id })
    end

    it 'has the correct response body' do
      expect(response.response_code).to eq 200
      expect(response.body).to eq [@message_one, @message_two].to_json
    end
  end

  describe '#create' do

    before do
      @user_one = User.create!
      @user_two = User.create!
      @conversation = Conversation.create!(sender_id: @user_one.id, receiver_id: @user_two.id)

      get(:create, params: { message: { conversation_id: @conversation.id } })
    end

    it 'creates the message' do
      expect(response.response_code).to eq 200
      expect(Message.where(conversation_id: @conversation.id).first).to be_a Message
    end
  end
end
