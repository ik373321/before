class TweetsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create,:update,:edit,:destroy] #except: [:index, :show]
  before_action :search_tweet, only: [:index, :runsearch]
  def index
   @tweet = Tweet.order('created_at DESC').page(params[:page]).per(25)
  #  set_tweet_column
  #  set_tag_column
  @country = Country.where.not(id: 1)
  end

  def new
    @tweet = TweetsTag.new
    #binding.pry

  end
  
  def create
    @tweet = TweetsTag.new(tweets_params)
    if @tweet.valid?
      @tweet.save
      redirect_to root_path
    else
     # binding.pry
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
    #binding.pry
    @tweet.destroy
    redirect_to root_path
  end
  
  def asia
    @tweet = Tweet.where(country_id:"195").or(Tweet.where(country_id:"4")).or(Tweet.where(country_id:"5")).or(Tweet.where(country_id:"11")).or(Tweet.where(country_id:"15"))
    .or(Tweet.where(country_id:"16")).or(Tweet.where(country_id:"18")).or(Tweet.where(country_id:"19")).or(Tweet.where(country_id:"20")).or(Tweet.where(country_id:"21"))
    .or(Tweet.where(country_id:"24")).or(Tweet.where(country_id:"35")).or(Tweet.where(country_id:"40")).or(Tweet.where(country_id:"41")).or(Tweet.where(country_id:"98"))
    .or(Tweet.where(country_id:"46")).or(Tweet.where(country_id:"115")).or(Tweet.where(country_id:"50")).or(Tweet.where(country_id:"54")).or(Tweet.where(country_id:"56"))
    .or(Tweet.where(country_id:"68")).or(Tweet.where(country_id:"76")).or(Tweet.where(country_id:"77")).or(Tweet.where(country_id:"78")).or(Tweet.where(country_id:"85"))
    .or(Tweet.where(country_id:"97")).or(Tweet.where(country_id:"99")).or(Tweet.where(country_id:"104")).or(Tweet.where(country_id:"123")).or(Tweet.where(country_id:"125"))
    .or(Tweet.where(country_id:"127")).or(Tweet.where(country_id:"129")).or(Tweet.where(country_id:"139")).or(Tweet.where(country_id:"140")).or(Tweet.where(country_id:"142"))
    .or(Tweet.where(country_id:"144")).or(Tweet.where(country_id:"151")).or(Tweet.where(country_id:"149")).or(Tweet.where(country_id:"169")).or(Tweet.where(country_id:"173"))
    .or(Tweet.where(country_id:"182")).or(Tweet.where(country_id:"184")).or(Tweet.where(country_id:"185")).order('created_at DESC').page(params[:page]).per(25)
  end

 def africa
  @tweet = Tweet.where(country_id:"8").or(Tweet.where(country_id:"12")).or(Tweet.where(country_id:"27")).or(Tweet.where(country_id:"29")).or(Tweet.where(country_id:"37"))
  .or(Tweet.where(country_id:"38")).or(Tweet.where(country_id:"43")).or(Tweet.where(country_id:"44")).or(Tweet.where(country_id:"45")).or(Tweet.where(country_id:"48"))
  .or(Tweet.where(country_id:"49").or(Tweet.where(country_id:"61"))).or(Tweet.where(country_id:"62")).or(Tweet.where(country_id:"64")).or(Tweet.where(country_id:"66"))
  .or(Tweet.where(country_id:"67")).or(Tweet.where(country_id:"71")).or(Tweet.where(country_id:"71")).or(Tweet.where(country_id:"73")).or(Tweet.where(country_id:"74"))
  .or(Tweet.where(country_id:"79")).or(Tweet.where(country_id:"82")).or(Tweet.where(country_id:"88")).or(Tweet.where(country_id:"89")).or(Tweet.where(country_id:"90"))
  .or(Tweet.where(country_id:"95")).or(Tweet.where(country_id:"100")).or(Tweet.where(country_id:"102")).or(Tweet.where(country_id:"103")).or(Tweet.where(country_id:"105"))
  .or(Tweet.where(country_id:"110")).or(Tweet.where(country_id:"117")).or(Tweet.where(country_id:"119")).or(Tweet.where(country_id:"122")).or(Tweet.where(country_id:"148"))
  .or(Tweet.where(country_id:"150")).or(Tweet.where(country_id:"152")).or(Tweet.where(country_id:"160")).or(Tweet.where(country_id:"165")).or(Tweet.where(country_id:"166"))
  .or(Tweet.where(country_id:"167")).or(Tweet.where(country_id:"171")).or(Tweet.where(country_id:"172")).or(Tweet.where(country_id:"175")).or(Tweet.where(country_id:"176"))
  .or(Tweet.where(country_id:"177")).or(Tweet.where(country_id:"181")).or(Tweet.where(country_id:"188")).or(Tweet.where(country_id:"190")).or(Tweet.where(country_id:"193"))
  .or(Tweet.where(country_id:"194")).order('created_at DESC').page(params[:page]).per(25)
 end

 def namerica
  @tweet =  Tweet.where(country_id:"6").or(Tweet.where(country_id:"32")).or(Tweet.where(country_id:"42")).or(Tweet.where(country_id:"51")).or(Tweet.where(country_id:"55"))
  .or(Tweet.where(country_id:"59")).or(Tweet.where(country_id:"63")).or(Tweet.where(country_id:"75")).or(Tweet.where(country_id:"92")).or(Tweet.where(country_id:"93"))
  .or(Tweet.where(country_id:"94")).or(Tweet.where(country_id:"111")).or(Tweet.where(country_id:"112")).or(Tweet.where(country_id:"113")).or(Tweet.where(country_id:"121"))
  .or(Tweet.where(country_id:"128")).or(Tweet.where(country_id:"131")).or(Tweet.where(country_id:"133")).or(Tweet.where(country_id:"137")).or(Tweet.where(country_id:"155"))
  .or(Tweet.where(country_id:"163")).or(Tweet.where(country_id:"174")).order('created_at DESC').page(params[:page]).per(25)
 end

 def samerica
  @tweet =  Tweet.where(country_id:"9").or(Tweet.where(country_id:"25")).or(Tweet.where(country_id:"26")).or(Tweet.where(country_id:"39")).or(Tweet.where(country_id:"65"))
  .or(Tweet.where(country_id:"84")).or(Tweet.where(country_id:"106")).or(Tweet.where(country_id:"136")).or(Tweet.where(country_id:"145")).or(Tweet.where(country_id:"153"))
  .or(Tweet.where(country_id:"156")).or(Tweet.where(country_id:"161")).order('created_at DESC').page(params[:page]).per(25)
 end
 def europe
  @tweet = Tweet.where(country_id:"2").or(Tweet.where(country_id:"3")).or(Tweet.where(country_id:"10")).or(Tweet.where(country_id:"14")).or(Tweet.where(country_id:"17"))
  .or(Tweet.where(country_id:"58")).or(Tweet.where(country_id:"23")).or(Tweet.where(country_id:"28")).or(Tweet.where(country_id:"34")).or(Tweet.where(country_id:"36"))
  .or(Tweet.where(country_id:"52")).or(Tweet.where(country_id:"60")).or(Tweet.where(country_id:"60")).or(Tweet.where(country_id:"72")).or(Tweet.where(country_id:"80"))
  .or(Tweet.where(country_id:"81")).or(Tweet.where(country_id:"83")).or(Tweet.where(country_id:"86")).or(Tweet.where(country_id:"87")).or(Tweet.where(country_id:"91"))
  .or(Tweet.where(country_id:"101")).or(Tweet.where(country_id:"108")).or(Tweet.where(country_id:"109")).or(Tweet.where(country_id:"126")).or(Tweet.where(country_id:"130"))
  .or(Tweet.where(country_id:"138")).or(Tweet.where(country_id:"143")).or(Tweet.where(country_id:"146")).or(Tweet.where(country_id:"147")).or(Tweet.where(country_id:"154"))
  .or(Tweet.where(country_id:"157")).or(Tweet.where(country_id:"158")).or(Tweet.where(country_id:"159")).or(Tweet.where(country_id:"162")).or(Tweet.where(country_id:"47"))
  .or(Tweet.where(country_id:"168")).or(Tweet.where(country_id:"178")).or(Tweet.where(country_id:"180")).or(Tweet.where(country_id:"183")).or(Tweet.where(country_id:"186"))
  .or(Tweet.where(country_id:"189")).or(Tweet.where(country_id:"187")).or(Tweet.where(country_id:"191")).or(Tweet.where(country_id:"192")).or(Tweet.where(country_id:"196"))
  .order('created_at DESC').page(params[:page]).per(25)

 end
 def oceania
  @tweet = Tweet.where(country_id:"33").or(Tweet.where(country_id:"53")).or(Tweet.where(country_id:"57")).or(Tweet.where(country_id:"69")).or(Tweet.where(country_id:"120"))
  .or(Tweet.where(country_id:"124")).or(Tweet.where(country_id:"132")).or(Tweet.where(country_id:"134")).or(Tweet.where(country_id:"135")).or(Tweet.where(country_id:"141"))
  .or(Tweet.where(country_id:"164")).or(Tweet.where(country_id:"170")).order('created_at DESC')  .page(params[:page]).per(25)
 end

 def search
    return nil if params[:keyword] == ""
    tag = Tag.where(['name LIKE ?', "%#{params[:keyword]}%"] )
    render json:{ keyword: tag }
  #binding.pry
 end

 def runsearch
  @results = @p.result#.includes(:tag) 
 # binding.pry
 end

 def tag
   @tag = Tag.all
 end


def stag
  @tag = Tag.find(params[:format])
  @tweets = @tag.tweets
  #binding.pry
end


  





  private

  def tweets_params
    params.require(:tweets_tag).permit(:title, :risk_id,:country_id,:city,:block,:year,:month,:day_id,:time,:detail,:name).merge(user_id: current_user.id)
  end

  def search_tweet
    @p = Tweet.ransack(params[:q])  
   #binding.pry
  end



  # def set_tweet_column
  #   @tweet_country_id = Tweet.select("country_id").distinct  # 重複なくnameカラムのデータを取り出す
  # end

  # def set_tag_column
  #   @tag_name = Tag.select("name").distinct
  # end

end
