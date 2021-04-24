module UsersHelper
  def pers(user)
    User.find(user.user_id)
  end

  def followutn(follower, _user)
    @follow = Following.where(user_id: current_user.id, follower_id: follower.user_id).first
    return unless follower.user_id != current_user.id

    if Following.where(user_id: current_user.id, follower_id: follower.user_id).any?
      (link_to 'Unfollow', following_path(@follow), method: :delete, class: 'text-right').html_safe
    else
      (link_to 'Follow', followings_path(follower.user_id), method: :post, class: 'text-right').html_safe
    end
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  def time(tweet)
    time = DateTime.now
    sum = tweet.created_at
    return tweet.created_at.strftime('%h %m, %Y') if tweet.created_at.year < time.year
    return tweet.created_at.strftime('%h %m, %Y') if tweet.created_at.month < time.month
    return tweet.created_at.strftime('%h %m, %Y') if tweet.created_at.day < time.day - 2
    return '2 days ago' if tweet.created_at.day < time.day - 1
    return '1 day ago' if tweet.created_at.day < time.day
    return "#{time.hour - sum.hour}h ago" if time.hour > sum.hour
    return "#{time.min - sum.min}m ago" if time.min > sum.min

    "#{time.sec - sum.sec}s ago"
  end

  # rubocop:enable Metrics/CyclomaticComplexity
  def followbtn(user)
    return unless user.id != current_user.id

    @follow = Following.where(user_id: current_user.id, follower_id: user.id).first
    if Following.where(user_id: current_user.id, follower_id: user.id).any?
      (link_to "<i class='fa fa-2x fa-minus-square-o' aria-hidden='true'></i>".html_safe,
               following_path(@follow), method: :delete).html_safe
    else
      (link_to "<i class='fa fa-2x fa-plus-square-o' aria-hidden='true'></i>".html_safe, followings_path(user.id),
               method: :post).html_safe
    end
  end
end
