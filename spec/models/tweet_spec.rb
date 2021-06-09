require 'rails_helper'

RSpec.describe Tweet, type: :model do
  describe 'ツイート投稿' do
    before do
      @tweet = FactoryBot.build(:tweet)
    end
    context 'ツイート投稿がうまくいくとき' do
      it '投稿時に必要な値が入っていれば登録できる' do
        expect(@tweet).to be_valid
      end
    end

    context 'ツイート投稿がうまくいかないとき' do
      it 'titleが空では登録できない' do
        @tweet.title = ''
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Title can't be blank")
      end
      it 'blockが空では登録できない' do
        @tweet.block = ''
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Block can't be blank")
      end

      it 'yearが空では登録できない' do
        @tweet.year = ''
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Year can't be blank")
      end
      it 'yearが数字以外では登録できない' do
        @tweet.year = 'aaaa'
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('Year is invalid')
      end
      it 'yearが4桁以外では登録できない' do
        @tweet.year = '11111'
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('Year is invalid')
      end
      it 'yearが全角では登録できない' do
        @tweet.year = '１１１１'
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('Year is invalid')
      end
      it 'monthが空では登録できない' do
        @tweet.month = ''
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Month can't be blank")
      end
      it 'monthが1以上でないと登録できない' do
        @tweet.month = '0'
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('Month must be greater than or equal to 1')
      end
      it 'monthが12以下でないと登録できない' do
        @tweet.month = '13'
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('Month must be less than or equal to 12')
      end
      it 'monthが数字以外では登録できない' do
        @tweet.month = 'aa'
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('Month is not a number')
      end
      it 'monthが全角では登録できない' do
        @tweet.month = '１１１'
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('Month is not a number')
      end
      it 'timeが25文字以下でないと登録できない' do
        @tweet.time = 'aaaaaaaaaaaaaaaaaaaaaaaaa1'
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('Time is too long (maximum is 25 characters)')
      end

      it 'detailが空では登録できない' do
        @tweet.detail = ''
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Detail can't be blank")
      end

      it 'risk_idが1では登録できない' do
        @tweet.risk_id = 1
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('Risk must be other than 1')
      end
      it 'country_idが1では登録できない' do
        @tweet.country_id = 1
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('Country must be other than 1')
      end
      it 'day_idが1では登録できない' do
        @tweet.day_id = 1
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('Day must be other than 1')
      end
    end
  end
end
