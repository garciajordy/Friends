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

  def followtn(follower)
    @follow = Following.where(user_id: current_user.id, follower_id: follower.user_id).first
    return unless follower.user_id != current_user.id

    if Following.where(user_id: current_user.id, follower_id: follower.user_id).any?
      (link_to "<i class='fa fa-2x text-right mr-5 fa-minus' aria-hidden='true'></i>".html_safe,
               following_path(@follow), method: :delete).html_safe
    else
      (link_to "<i class='fa fa-2x text-right mr-5 fa-plus' aria-hidden='true'></i>".html_safe,
               followings_path(follower.user_id),
               method: :post).html_safe
    end
  end

  def followt(follower)
    @follow = Following.where(user_id: current_user.id, follower_id: follower.id).first
    return unless follower.id != current_user.id

    if Following.where(user_id: current_user.id, follower_id: follower.id).any?
      (link_to "<i class='fa fa-2x text-right mr-5 fa-minus' aria-hidden='true'></i>".html_safe,
               following_path(@follow), method: :delete).html_safe
    else
      (link_to "<i class='fa fa-2x text-right mr-5 fa-plus' aria-hidden='true'></i>".html_safe,
               followings_path(follower.id),
               method: :post).html_safe
    end
  end

  def time(tweet)
    sum = (Time.now - tweet.created_at).to_i
    minute = 60
    hour = minute * 60
    day = hour * 24
    return "#{sum}s ago" if sum < minute
    return "#{(sum / minute).to_i}m ago" if sum < hour
    return "#{(sum / hour).to_i}h ago" if sum < day
    return "#{(sum / day).to_i} day ago" if sum < (day * 2)
    return "#{(sum / day).to_i} days ago" if sum < (day * 3)

    tweet.created_at.strftime('%h %m, %Y')
  end

  def followbtn(user)
    if user.id == current_user.id

      return (link_to "<i class='fa fa-2x fa-pencil' aria-hidden='true'></i>".html_safe,
                      edit_user_registration_path).html_safe
    end
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

  def mutual(user)
    array = []
    current_user.followings.map do |follow|
      array.push(follow.follower_id)
    end
    return 'No mutual followings' if Following.where(user_id: user.id).where(follower_id: array).count.zero?
    return '1 mutual following' if Following.where(user_id: user.id).where(follower_id: array).count == 1

    sum = Following.where(user_id: user.id).where(follower_id: array).count
    "#{sum} mutual followings"
  end
end
