class GossipController < ApplicationController
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
end
