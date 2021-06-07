class Tag < ApplicationRecord
  has_many :tweet_tag_relations
  has_many :tweets, through: :tweet_tag_relations, dependent: :destroy

  validates :name, uniqueness: true
end
