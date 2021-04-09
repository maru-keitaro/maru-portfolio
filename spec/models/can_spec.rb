require 'rails_helper'

RSpec.describe Can, type: :model do
  before do
    @can = FactoryBot.build(:can)
  end

  describe '投稿' do
    context '正常系' do
      it 'メモ以外の項目があれば投稿できる' do
        expect(@can).to be_valid
      end

      it '何を？に1以上が選択されている場合は投稿できる' do
        @can.active_id = 1
        expect(@can).to be_valid
      end

      it 'どこで？に1以上が選択されている場合は投稿できる' do
        @can.place_id = 1
        expect(@can).to be_valid
      end

      it '何分？に1以上が選択されている場合は投稿できる' do
        @can.set_time_id = 1
        expect(@can).to be_valid
      end

      it 'メモがあれば投稿できる' do
        @can.description = 'hello'
        expect(@can).to be_valid
      end

    end

    context '異常系' do
      it '画像がないと投稿できない' do
        @can.image = nil
        @can.valid?
        expect(@can.errors.full_messages).to include ("画像を入力してください")
      end

      it '何を？に0が選択されている場合は投稿できない' do
        @can.active_id = 0
        @can.valid?
        expect(@can.errors.full_messages).to include ("何を？は0以外の値にしてください")
      end

      it 'どこで？に0が選択されている場合は投稿できない' do
        @can.place_id = 0
        @can.valid?
        expect(@can.errors.full_messages).to include ("どこで？は0以外の値にしてください")
      end

      it '何分？に0が選択されている場合は投稿できない' do
        @can.set_time_id = 0
        @can.valid?
        expect(@can.errors.full_messages).to include ("何分？は0以外の値にしてください")
      end

    end
  end
end
