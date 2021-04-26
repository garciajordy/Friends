class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
  end

  def index
    @array = Following.where(user_id: current_user.id).select(:follower_id)
    @user = current_user
    @rray = []
    @rray.push(current_user.id)
    @array.map { |e| @rray.push(e.follower_id) }
    @people = User.where.not(id: @rray).order('RANDOM()')
  end

  def follow
    @user = User.find(params[:id])
  end

  def followed
    @user = User.find(params[:id])
  end
end
