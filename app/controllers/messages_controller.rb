class MessagesController < ApplicationController

  # The index call will always be scoped to the conversation_id
  def index
    @messages = Message.where(conversation_id: allowed_params[:conversation_id])
    respond_to do |format|
      format.json { render json: @messages }
    end
  end

  def create
    @message = Message.create!(allowed_params)
    respond_to do |format|
      format.json { render json: @message }
    end
  end

  private

  def allowed_params
    params.require(:message).permit(:conversation_id)
  end
end
