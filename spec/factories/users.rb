FactoryBot.define do
  factory :user do
    nickname              { 'furima山田' }
    email                 { Faker::Internet.email }
    password              { '1234asdf' }
    password_confirmation { password }
 
  end
end