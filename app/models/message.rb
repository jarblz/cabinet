class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :user
  validates :body, presence: true
  after_create :notify_receiver

  private

  def notify_receiver
    MessageMailer.new_message(self).deliver_now!
  end


end
