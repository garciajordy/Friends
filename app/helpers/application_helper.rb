# rubocop:disable Metrics/ModuleLength
module ApplicationHelper
  def messa(mes)
    return 'warning' if mes == 'notice'

    mes
  end

  def see_all
    return unless current_user.messages.count.positive?

    (link_to 'See all',
             conversation_path(Conversation.find(current_user.messages.last.conversation_id))).html_safe
  end

  def convcheck
    Conversation.where(user_id: current_user.id).or(Conversation.where(other_user: current_user.id))
  end

  def likebtn(tweet)
    like = Like.where(tweet_id: tweet.id).where(user_id: current_user.id).first
    if Like.where(tweet_id: tweet.id).where(user_id: current_user.id).any?
      (link_to "<i class='fa fa-2x fa-thumbs-o-down' aria-hidden='true'></i>".html_safe,
               tweet_like_path(like.tweet_id, like), method: :delete).html_safe
    else
      (link_to "<i class='fa fa-2x fa-thumbs-o-up' aria-hidden='true'></i>".html_safe, tweet_likes_path(tweet),
               method: :post).html_safe
    end
  end

  def likecount(tweet)
    Like.where(tweet_id: tweet.id).count
  end

  def conversation
    convcheck.first
  end

  def messages
    current_user.received_messages.first.text if current_user.received_messages.any?
  end

  def otheruser(con)
    if con.messages.last.send_user_id == current_user.id
      User.find(con.messages.last.receive_user_id)
    else
      User.find(con.messages.last.send_user_id)
    end
  end

  def otheruser2(con)
    if con.user_id == current_user.id
      User.find(con.other_user_id)
    else
      User.find(con.user_id)
    end
  end

  def youor(con)
    return 'Start a conversation' if con.messages.count.zero?
    return 'You: ' if con.messages.last.send_user_id == current_user.id
  end

  def textlength(text)
    if text.length > 25
      "#{text[0..25]}..."
    else
      text
    end
  end

  def textlengt(text)
    if text.length > 15
      "#{text[0..15]}..."
    else
      text
    end
  end

  def messagebox(message)
    if message.send_user_id == current_user.id
      'word-breaker'
    else
      'word-break'
    end
  end

  def imageclass(message)
    return 'ordering' if message.send_user_id == current_user.id
  end

  def messageclass(message)
    return 'justify-content-end' if message.send_user_id == current_user.id
  end

  def messageorstart(user)
    array = []
    array << user.id
    array << current_user.id
    @con = Conversation.where(user_id: array).where(other_user_id: array).first
    if @con
      (link_to 'MESSAGE', conversation_path(@con), class: 'px-4 py-3 color').html_safe
    elsif user.id == current_user.id
      nil
    else
      (link_to 'MESSAGE', conversations_path(user), method: :post, class: 'px-4 py-3 color').html_safe
    end
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  def convers
    @convcheck = Conversation.where(user_id: current_user.id).or(Conversation.where(other_user: current_user.id))
    return @convcheck unless @convcheck.any?
    rray = []
    new_arr = []
    array = []
    @convcheck.each do |con|
      rray << con.messages.last if con.messages.last
    end
    return current_user.conversations.order(created_at: :desc) if rray.empty?

    rray.compact.map { |e| new_arr << e.conversation_id }
    current_user.conversations.order(created_at: :desc).each { |e| new_arr << e.id }
    new_arr.uniq.map do |id|
      array << Conversation.find(id)
    end

    array
  end
  # rubocop:enable Metrics/CyclomaticComplexity
end
# rubocop:enable Metrics/ModuleLength
