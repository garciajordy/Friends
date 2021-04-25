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
end
