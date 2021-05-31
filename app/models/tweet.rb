class Tweet < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :risk
  belongs_to :day
  belongs_to :country
  belongs_to :user
  has_many   :comments
  has_many :tweet_tag_relations
  has_many :tags, through: :tweet_tag_relations


  
end
