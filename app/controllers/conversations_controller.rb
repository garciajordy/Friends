class ConversationsController < ApplicationController
  def show
    @conversation = Conversation.find(params[:id])
    @num = 0
    @array = []
    @array << @conversation.user_id
    @array << @conversation.other_user_id
    @num = @array.select { |e| @num = e if e != current_user.id }
    
  end

  def create
    @conversation = Conversation.create(user_id: current_user.id, other_user_id: params[:id])
    redirect_to @conversation if @conversation.save
  end
end
