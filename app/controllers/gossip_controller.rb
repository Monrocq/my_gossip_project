class GossipController < ApplicationController
  before_action :authenticate_good_user, only: [:edit, :update, :destroy]
  
  def index
    @id = params[:id].to_i
    puts params[:id]
  end

  def edit
    @post = Gossip.find(params[:id])
  end

  def update
    @post = Gossip.find(params[:id])
    post_params = params.permit(:title, :content)
    @post.update(post_params)
    redirect_to '/'
  end

  def destroy
    @post = Gossip.find(params[:id])
    @post.destroy
    redirect_to '/'
  end

  def authenticate_good_user
    puts params[:id]
    puts session[:user_id]
    unless params[:id] == session[:user_id]
      flash[:danger] = "Please log in."
      redirect_to '/'
    end
  end
end
