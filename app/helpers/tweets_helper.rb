module TweetsHelper
  def follower(user)
    Following.where(follower_id: user.id)
  end

  def felowbtn(user)
    (link_to 'Follow', followings_path(user), method: :post, class: 'text-right').html_safe
  end
end
