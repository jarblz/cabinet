class MessagesController < ApplicationController
  before_action :find_conversation!

  def create
    @conversation ||= Conversation.create( author_id: current_user.id,
                                           receiver_id: @receiver.id,
                                           connection_id: @connection.id )
    if @conversation.errors.any?
      redirect_to conversations_path, alert: "Oops! Invalid Connection." and return
    else
      @message = current_user.messages.build(message_params)
      @message.conversation_id = @conversation.id
      @message.save!
      flash[:notice] = "Your message was sent!"
      redirect_to conversation_path(@conversation)
    end
  end

  def new
    redirect_to conversation_path(@conversation) and return if @conversation
    @message = current_user.messages.build
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end

  def find_conversation!
    if params[:receiver_id]
      @receiver = User.find_by(slug: params[:receiver_id]) || User.find_by(id: params[:receiver_id])
      if !@receiver
        flash[:alert] = "Oops! I couldn't find that user!"
        redirect_to(root_path) and return
      end
      @conversation = Conversation.between(current_user.id, @receiver.id)[0]
      @connection = Recommendation.find_by(id: params[:connection_id]) || @conversation.try(:connection)
      if !@connection
        flash[:alert] = "Oops! You must have a connection with this user to chat!"
        redirect_to(root_path) and return
      end
    else
      @conversation = Conversation.find_by(id: params[:conversation_id])
      redirect_to(root_path) and return unless @conversation && @conversation.participates?(current_user)
    end
  end
end
