class Tweet < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :risk
  belongs_to :day
  belongs_to :country
  belongs_to :user
  has_many   :comments
  has_many :tweet_tag_relations
  has_many :tags, through: :tweet_tag_relations

  validates :title, :block, :year, :month,:detail, presence: true
  validates :time, length: { maximum: 25 }
  validates :risk_id,:country_id,:day_id ,numericality: { other_than: 1 }
  validates :month, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 12 }
  validates :year, format: { with: /\A([0-9]{4})+\z/ }
  
end
