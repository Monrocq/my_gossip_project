class NewController < ApplicationController
  def index
    
  end

  def create
    @user = User.find(1)
    @gossip = Gossip.new(title: params[:title], content: params[:content], user: @user)
    
    if @gossip.save
      redirect_to '/'
    else
      render :index
    end
  end
end
