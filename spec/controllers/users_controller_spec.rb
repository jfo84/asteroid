require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe '#index' do

    before do
      @user_one = User.create!
      @user_two = User.create!

      get :index
    end

    it 'has the correct response body' do
      expect(response.response_code).to eq 200
      expect(response.body).to eq [@user_one, @user_two].to_json
    end
  end

  describe '#create' do

    before do
      get :create
    end

    it 'creates the user' do
      expect(response.response_code).to eq 200
      expect(User.first).to be_a User
    end
  end
end
