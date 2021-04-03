require 'rails_helper'
RSpec.describe Book, type: :model do
  describe '#create' do
  before do
    @user = FactoryBot.build(:book)
  end

  describe '連絡帳記録' do
    context '連絡帳記録がうまくいく時' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@book).to be_valid
      end
      it 'mood_idは空でも保存できること' do
        @book.mood_id = ''
        expect(@book).to be_valid
      end
      it 'body_temperature_idは空でも保存できること' do
        @book.body_temperature_id = ''
        expect(@book).to be_valid
      end
      it 'sleep_idは空でも保存できること' do
        @book.sleep_id = ''
        expect(@book).to be_valid
      end
      it 'comment1は空でも保存できること' do
        @book.comment1 = ''
        expect(@book).to be_valid
      end
      it 'reason_idは空でも保存できること' do
        @book.reason_id = ''
        expect(@book).to be_valid
      end
      it 'period_idは空でも保存できること' do
        @book.period_id = ''
        expect(@book).to be_valid
      end
      it 'comment2は空でも保存できること' do
        @book.comment2 = ''
        expect(@book).to be_valid
      end
    end


    context '連絡帳記録がうまくいかない時' do
      it 'presence_idを選択していないと登録できない' do
        @book.presence_id = 0
        @book.valid?
        expect(@book.errors.full_messages).to include "Presence must be other than 0"
      end
    end
  end
 end
end