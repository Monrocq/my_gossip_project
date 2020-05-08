class NewController < ApplicationController
  before_action :authenticate_user, only: [:create, :index]

  def index
    
  end

  def create
    if current_user
      @user = User.find_by(id: session[:user_id])
    else
      @user = User.find(1)
    end
    @gossip = Gossip.new(title: params[:title], content: params[:content], user: @user)
    
    if @gossip.save
      flash[:sucess] = "Potin bien créé !"
      redirect_to '/'
    else
      render :index
    end
  end
end
