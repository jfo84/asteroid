class User < ApplicationRecord
  has_many :sender_conversations,
    foreign_key: :sender_id,
    dependent: :destroy
  has_many :receiver_conversations,
    foreign_key: :receiver_id,
    dependent: :destroy

  # This it the main conversation-related API
  # Sender and receiver are really just implementation details
  def conversations
    sender_conversations + receiver_conversations
  end
end
