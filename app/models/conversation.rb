class Conversation < ApplicationRecord
  # TODO: add seen/unseen flags for author and receiver
  belongs_to :author, class_name: 'User'
  belongs_to :receiver, class_name: 'User'
  belongs_to :connection, class_name: "Recommendation"

  has_many :messages, -> { order(created_at: :asc) }, dependent: :destroy

  validates :author, uniqueness: {scope: :receiver}
  validate :connection_is_match


  scope :participating, -> (user) do
    where("(conversations.author_id = ? OR conversations.receiver_id = ?)", user.id, user.id)
  end

  scope :between, -> (sender_id, receiver_id) do
    where(author_id: sender_id, receiver_id: receiver_id).or(where(author_id: receiver_id, receiver_id: sender_id)).limit(1)
  end

  def with(current_user)
    author == current_user ? receiver : author
  end

  def participates?(user)
    author == user || receiver == user
  end

  def last_message_date
    self.messages.last.created_at
  end

  private

  def connection_is_match
    errors.add(:connection, "This is not a valid match") unless self.connection.match?
  end

end
