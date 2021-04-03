require 'rails_helper'
RSpec.describe User, type: :model do
  describe '#create' do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいく時' do
      it 'email,password,password_confirmation,child_name,classroom,childminder1が登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上であれば登録できる' do
        @user.password = '000aaa'
        @user.password_confirmation = '000aaa'
        expect(@user).to be_valid
      end
      it 'child_nameが全角文字であれば登録できる' do
        @user.child_name = '桃田賢斗'
        expect(@user).to be_valid
      end
      it 'classroomが全角文字であれば登録できる' do
        @user.classroom = 'なのはな'
        expect(@user).to be_valid
      end
      it 'childminder1が全角文字であれば登録できる' do
        @user.childminder1 = '夏風真夏'
        expect(@user).to be_valid
      end
    end


    context '新規登録がうまくいかない時' do
      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it '重複したemailだと登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@を含むものでないと登録できない' do
        @user.email = 'aaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが英数混合の5文字以下だと登録できない' do
        @user.password = '000aa'
        @user.password_confirmation = '000aa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'paaawordが英語のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordが数字のみでは登録できない' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordが全角では登録できない' do
        @user.password = '０００ａａａ'
        @user.password_confirmation = '０００ａａａ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'password_confirmationが空だと登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '子供の名前が空だと登録できない' do
        @user.child_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Child name can't be blank")
      end
      it '子供の名前が全角(漢字・平仮名・カタカナ)以外では登録できない' do
        @user.child_name = "kanji"
        @user.valid?
        expect(@user.errors.full_messages).to include("Child name is invalid")
      end
      it 'クラス名が空だと登録できない' do
        @user.classroom = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Classroom can't be blank")
      end
      it 'クラス名が全角(漢字・平仮名・カタカナ)以外では登録できない' do
        @user.classroom = "kanji"
        @user.valid?
        expect(@user.errors.full_messages).to include("Classroom is invalid")
      end
      it '担任の名前が空だと登録できない' do
        @user.childminder1 = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Childminder1 can't be blank")
      end
      it '担任の名前が全角(漢字・平仮名・カタカナ)以外では登録できない' do
        @user.childminder1 = "kanji"
        @user.valid?
        expect(@user.errors.full_messages).to include("Childminder1 is invalid")
      end
    end
  end
 end
end