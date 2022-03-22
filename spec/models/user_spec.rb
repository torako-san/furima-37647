require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、family_nameとgiven_name、family_name_kanaとgiven_name_kana、birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      
      #ユーザー情報の確認テスト

      it 'nicknameが空では登録できない' do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できない' do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it 'emailは@を含まないと登録できない' do
        @user.email = "tetete.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it 'passwordが空では登録できない' do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが5文字以下では登録できない' do
        @user.password = "a1234"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it 'passwordが英字を含んでいなければ登録できない' do
        @user.password = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password は6文字以上かつ英字と数字の両方を含めて下さい")
      end

      it 'passwordが数字を含んでいなければ登録できない' do
        @user.password = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password は6文字以上かつ英字と数字の両方を含めて下さい")
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
         @user.password = "a123456"
         @user.password_confirmation = "a12345"
         @user.valid?
         expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      # 本人情報の確認テスト

      it 'family_nameが空では登録できない' do
        @user.family_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end

      it 'given_nameが空では登録できない' do
        @user.given_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Given name can't be blank")
      end

      it 'family_nameは、全角文字でなければ登録できない' do
        @user.family_name = "torako"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name に全角文字を入力して下さい")
      end

      it 'given_nameは、全角文字でなければ登録できない' do
        @user.given_name = "torako"
        @user.valid?
        expect(@user.errors.full_messages).to include("Given name に全角文字を入力して下さい")
      end

      it 'family_name_katakanaが空では登録できない' do
        @user.family_name_katakana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name katakana can't be blank")
      end

      it 'given_name_katakanaが空では登録できない' do
        @user.given_name_katakana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Given name katakana can't be blank")
      end

      it 'family_name_katakanaは、全角カタカナでなければ登録できない' do
        @user.family_name_katakana = "あいうえお"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name katakana はカタカナで入力して下さい")
      end

      it 'given_name_katakanaは、全角カタカナでなければ登録できない' do
        @user.given_name_katakana = "あいうえお"
        @user.valid?
        expect(@user.errors.full_messages).to include("Given name katakana はカタカナで入力して下さい")
      end

      it 'birthdayが空では登録できない' do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end