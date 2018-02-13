class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :user
  validates :body, presence: true
  after_create :notify_receiver

  private

  def notify_receiver
    # TODO: mailer hook goes here
  end


end
