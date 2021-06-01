class TweetsTag

  include ActiveModel::Model
  attr_accessor :title, :risk_id,:country_id,:city,:block,:year,:month,:day_id,:time,:detail,:user_id,:name



  validates :title, :block, :year, :month,:detail,:name ,  presence: true
  validates :time, length: { maximum: 25 }
  validates :risk_id,:country_id,:day_id ,numericality: { other_than: 1 }
  validates :month, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 12 }
  validates :year, format: { with: /\A([0-9]{4})+\z/ }

  def save
    tweet = Tweet.create(title:title,risk_id:risk_id,country_id:country_id,city:city,block:block,year:year,month:month,day_id:day_id,time:time,detail:detail,user_id:user_id)
    tag = Tag.where(name: name).first_or_initialize
    tag.save

    TweetTagRelation.create(tweet_id: tweet.id, tag_id: tag.id)
  end

end