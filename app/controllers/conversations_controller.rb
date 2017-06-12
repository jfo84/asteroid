class ConversationsController < ApplicationController

  # The index call will always be scoped to the sender_id and receiver_id
  def index
    @conversations = Conversation.where(
      sender_id: params[:sender_id],
      receiver_id: params[:receiver_id]
    )
    render json: @conversations
  end

  def create
    @conversation = Conversation.create!(allowed_params)
    render json: @conversation
  end

  private

  def allowed_params
    params.require(:conversation).permit(:sender_id, :receiver_id)
  end
end
