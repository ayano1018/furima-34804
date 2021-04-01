require 'rails_helper'

# RSpec.describe User, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end


RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '内容に問題がある場合' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end

    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end

    it 'emailが被っていた場合は登録できない（一意性）' do
      another_user.email = FactoryBot.build(:user, email:@user.email)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors_full_messages).to include("Email has already been taken")
    end

    it 'email@がない場合は登録できない' do
      @user.email = "kkkgmail.com"
      @user.valid?
      expect(@user.errors_full_messages).to include("Email is invalid")
    end
    end

    it 'passwordが存在してもpassword_confirmationが空では登録できない' do
      @user.password = '111aaa', @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end


    it 'passwordとpassword_confirmationが空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation は英字と数字の両方を含めて設定してください"
    end

    it 'password：5文字以下は登録できない' do
      @user.password = '123ab', @user.password_confirmation = '123ab'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password  は英字と数字の両方を含めて設定してください"
    end

    it 'password：半角英語のみは登録できない' do
      @user.password = 'aaaaaa', @user.password_confirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password  は英字と数字の両方を含めて設定してください"

    end

    it 'password：数字のみは登録できない' do
      @user.password = '111111', @user.password_confirmation = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password  は英字と数字の両方を含めて設定してください"

    end

    it 'password：全角英数混合は登録できない' do
      @user.password = '１２３Ａｂｃ', @user.password_confirmation = '１２３Ａｂｃ'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password  は英字と数字の両方を含めて設定してください"

    end

    it 'passwordとpassword_confirmationが一致しない場合、登録できない' do
      @user.password = 'aaa111', @user.password_confirmation = 'aaa112'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation は英字と数字の両方を含めて設定してください"

    end
    
    it 'last_nameが空では登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name can't be blank"
    end

    it '姓：全角（漢字・ひらがな・カタカナ）以外は登録できない' do
      @user.last_name = "kana"
      @user.valid?
      expect(@user.errors_full_messages).to include("First_name Full-width characters")
    end


    it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end
   
    it '名：全角（漢字・ひらがな・カタカナ）以外は登録できない' do
      @user.first_name = "kana"
      @user.valid?
      expect(@user.errors_full_messages).to include("First_name Full-width characters")
    end


    it 'flast_name_kanaが空では登録できない' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name kana can't be blank"
    end

    it '姓（フリガナ）：全角（カタカナ）以外は登録できない' do
      @user.last_name = "かな"
      @user.valid?
      expect(@user.errors_full_messages).to include("First_name Full-width characters")
    end


    it 'first_name_kanaが空では登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana can't be blank"
    end

    it '名（フリガナ）：全角（カタカナ）以外は登録できない' do
      @user.first_name = "かな"
      @user.valid?
      expect(@user.errors_full_messages).to include("First_name Full-width characters")
    end

    it 'birthが空では登録できない' do
      @user.birth = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Birth can't be blank"
    end

    context  '内容に問題ない場合' do
      it 'nicknameとemail、password他全ての項目が存在すれば登録できること' do
        expect(@user).to be_valid
      end
    end
  
  
  
  end
end