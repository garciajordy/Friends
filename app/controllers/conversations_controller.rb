class ConversationsController < ApplicationController
  def show
    @conversation = Conversation.find(params[:id])
    @num = 0
    @array = []
    @array << @conversation.user_id
    @array << @conversation.other_user_id
    @num = @array.select { |e| @num = e if e != current_user.id }

    @new_array = []
    @array = []
    @last = []
    current_user.messages.compact.each do |m|
      @new_array << m[:conversation_id]
    end
    @new_array.uniq.each do |id|
      @array << Conversation.find(id)
    end
    @array.map do |n|
      @last << n
    end
    @last.sort_by { |n| n.messages.last.created_at }
    @last.reverse!
  end

  def create
    @user = User.find(params[:format])
    @conversation = current_user.conversations.create(other_user_id: @user.id)
    redirect_to @conversation if @conversation.save
    params
  end
end
