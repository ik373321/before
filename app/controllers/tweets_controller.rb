class TweetsController < ApplicationController
  before_action :authenticate_user!,  except: [:index, :show]
  def index
    @tweet = Tweet.order('created_at DESC')
    @tweets = Tweet.where(country_id:"2",country_id:"3")
  end

  def new
    @tweet = Tweet.new
  end
  
  def create
    # binding.pry
    @tweet = Tweet.new(tweets_params)
    if @tweet.save
      redirect_to root_path
    else
      #binding.pry
      render :new
    end
  end

  def show
    @tweet = Tweet.find(params[:id])
    @comment = Comment.new
    @comments = @tweet.comments.includes(:user)
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end
  def update
    @tweet = Tweet.find(params[:id])
    if @tweet.update(tweets_params)
      redirect_to tweet_path
    else
      render :edit
    end
  end   
  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect_to root_path
  end



  private

  def tweets_params
    params.require(:tweet).permit(:title, :risk_id,:country_id,:city,:block,:year,:month,:day_id,:time,:detail).merge(user_id: current_user.id)
  end
end
