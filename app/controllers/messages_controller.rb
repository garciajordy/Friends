class MessagesController < ApplicationController
  def create
    @conversation = Conversation.find(params[:conversation_id])
    @num = 0
    @array = []
    @array << @conversation.user_id
    @array << @conversation.other_user_id
    @num = @array.select { |e| @num = e if e != current_user.id }
    @message = @conversation.messages.create(message_params)
    redirect_back(fallback_location: root_path) if @message.save
  end

  private

  def message_params
    params.require(:message).permit(:text, :send_user_id, :receive_user_id)
  end
end
