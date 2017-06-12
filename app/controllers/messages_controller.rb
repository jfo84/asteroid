class MessagesController < ApplicationController

  # The index call will always be scoped to the conversation_id
  def index
    @messages = Message.where(conversation_id: params[:conversation_id])
    render json: @messages
  end

  def create
    @message = Message.create!(allowed_params)
    render json: @message
  end

  private

  def allowed_params
    params.require(:message).permit(:conversation_id)
  end
end
