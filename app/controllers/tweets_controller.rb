class TweetsController < ApplicationController
  def index
    @tweet = Tweet.order('created_at DESC')
  end

  def new
    @tweet = Tweet.new
  end
  
  def create
 #   binding.pry
    @tweet = Tweet.new(tweets_params)
    if @tweet.save
      redirect_to root_path
    else
      binding.pry
      render :new
    end
  end

  private

  def tweets_params
    params.require(:tweet).permit(:title, :risk_id,:country_id,:city,:block,:year,:month,:day_id,:time,:detail).merge(user_id: current_user.id)
  end
end
