require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmation,last_name, first_name,last_name_kana,first_name_kana,birthday,が存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
  end

  context'新規登録できない時'do
        it 'メールアドレスが空ではできない' do
         @user.email = ''
         @user.valid?

         expect(@user.errors.full_messages).to include("Email can't be blank")
        end

        it '重複したemailが存在する場合は登録できない' do
          @user.save
          another_user = FactoryBot.build(:user)
          another_user.email = @user.email
          another_user.valid?

          expect(another_user.errors.full_messages).to include('Email has already been taken')
        end

        it 'emailは@を含まないと登録できない' do
          @user.email = 'testmail'
          @user.valid?
          expect(@user.errors.full_messages).to include('Email is invalid')
        end

        it 'パスワードが空ではできない' do
          @user.password = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end

        it 'パスワードは、５文字以下だと出来ない' do
          @user.password = '00000'
          @user.password_confirmation = '00000'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
 
        end

        it 'パスワードとパスワード（確認）は、値の一致でないと出来ない' do
          @user.password = '123456'
          @user.password_confirmation = '1234567'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
        it 'ニックネームが空では登録できない' do
          @user.nickname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include ("Nickname can't be blank")
        end
        it '英字のみのパスワードでは登録できない' do
          @user.password = 'aaaaaa'
          @user.password_confirmation = 'aaaaaa'
          @user.valid?

          expect(@user.errors.full_messages).to include ("Password は半角英数を両方含む必要があります")
          
        end
        it '数字のみのパスワードでは登録できない' do
          @user.password = '0000000'
          @user.password_confirmation ='0000000'
          @user.valid?
          expect(@user.errors.full_messages).to include ("Password は半角英数を両方含む必要があります")
        end

        it '全角文字を含むパスワードでは登録できない' do
          @user.password = 'ａａaaaa1'
          @user.password_confirmation ='ａａaaaa1'
          @user.valid?

          expect(@user.errors.full_messages).to include ("Password は半角英数を両方含む必要があります")
        end

        it '姓（全角）が空だと登録できない' do
          @user.last_name = ''
          @user.valid?
 
          expect(@user.errors.full_messages).to include("Last name can't be blank")
        end

        it '姓（全角）に半角文字が含まれていると登録できない' do
          @user.last_name = 'あああｲｲ'
          @user.valid?
          
          expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください")
        end

        it '名（全角）が空だと登録できない' do
          @user.first_name = ''
          @user.valid?
 
          expect(@user.errors.full_messages).to include("First name can't be blank")
        end

        it '名（全角）に半角文字が含まれていると登録できない' do
          @user.first_name = 'あああｲｲ'
          @user.valid?
 
          expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
        end

        it '姓（カナ）が空だと登録できない' do
          @user.last_name_kana = ''
          @user.valid?
 
          expect(@user.errors.full_messages).to include("Last name kana can't be blank")
        end

        it '姓（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
          @user.last_name_kana = 'あああｲｲ1'
          @user.valid?
          
          expect(@user.errors.full_messages).to include("Last name kana は全角カタカナで入力して下さい。")
        end

        it '名（カナ）が空だと登録できない' do
          @user.first_name_kana = ''
          @user.valid?
 
          expect(@user.errors.full_messages).to include("First name kana can't be blank")
        end

        it '名（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
          @user.first_name_kana = ''
          @user.valid?
 
          expect(@user.errors.full_messages).to include("First name kana は全角カタカナで入力して下さい。")
        end

        it '生年月日が空だと登録できない' do
          @user.birthday = ''
          @user.valid?
 
          expect(@user.errors.full_messages).to include("Birthday can't be blank")
        end


  end
end

#binding.pry
#@user.errors.full_messages