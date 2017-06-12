require 'rails_helper'

RSpec.describe ConversationsController, type: :controller do
  describe '#index' do

    before do
      @user_one = User.create!
      @user_two = User.create!
      @conversation = Conversation.create!(sender_id: @user_one.id, receiver_id: @user_two.id)

      get(:index, params: { sender_id: @user_one.id, receiver_id: @user_two.id })
    end

    it "has the correct response body" do
      expect(response.response_code).to eq 200
      expect(response.body).to eq [@conversation].to_json
    end
  end
end
