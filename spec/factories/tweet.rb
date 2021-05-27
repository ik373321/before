FactoryBot.define do
  factory :tweet do
    title              { '山田に起こった悲劇' }
    risk_id                 { 2 }
    country_id              { 124 }
    city       { "アユタヤ" }
    block              { '右曲がって左に行って左の方' }
    year                 { 1999 }
    month              { 6 }
    day_id { 3 }
    time              { "例)現地時間の14時くらい。21:00.25字以内" }
    detail                 { "道を聞かれている最中に携帯を盗まれてしまった。どうやら道を聞いてきた人と共犯" }
    association :user
  end
end