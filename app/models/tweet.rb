class Tweet < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :risk
  belongs_to :day
  belongs_to :country
  belongs_to :user
end
