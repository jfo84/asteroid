class ConversationsController < ApplicationController

  # The index call will always be scoped to the sender_id and receiver_id
  def index
    @conversations = Conversation.where(
      sender_id: allowed_params[:sender_id],
      receiver_id: allowed_params[:receiver_id]
    )
    respond_to do |format|
      format.json { render json: @conversations }
    end
  end

  def create
    @conversation = Conversation.create!(allowed_params)
    respond_to do |format|
      format.json { render json: @conversation }
    end
  end

  private

  def allowed_params
    params.require(:conversation).permit(:sender_id, :receiver_id)
  end
end
