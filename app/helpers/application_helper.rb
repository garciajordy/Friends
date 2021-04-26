module ApplicationHelper
  def messa(mes)
    return 'warning' if mes == 'notice'

    mes
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
    current_user.conversations
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

  def youor(con)
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
      "word-breaker"
    else
      "word-break"
    end
  end

  def imageclass(message)
    return 'ordering' if message.send_user_id == current_user.id
  end

  def messageclass(message)
    return 'justify-content-end' if message.send_user_id == current_user.id
  end
end
