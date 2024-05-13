require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'サインイン' do
    context 'サインインできるとき' do
      it '全てが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context 'サインインできないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailが重複すると登録できない' do
        @user.save
        other_user = FactoryBot.build(:user, email: @user.email)
        other_user.valid?
        expect(other_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailに@がないと登録できない' do
        @user.email = 'testtest'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '1a2b'
        @user.password_confirmation = '1a2b'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが英字のみだと登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Please input a combination of half-width alphanumeric characters.')
      end
      it 'passwordが数字のみだと登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Please input a combination of half-width alphanumeric characters.')
      end
      it 'passwordが全角を含むと登録できない' do
        @user.password = '1a1aああ'
        @user.password_confirmation = '1a1aああ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Please input a combination of half-width alphanumeric characters.')
      end
      it 'passwordと確認用passwordが違うと登録できない' do
        @user.password = '1a1a1a'
        @user.password_confirmation = '2b2b2b'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '姓が空では登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank",
                                                      'Family name is invalid. Input full-width characters.')
      end
      it '名が空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank",
                                                      'First name is invalid. Input full-width characters.')
      end
      it '姓が全角入力でないと登録できない' do
        @user.family_name = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name is invalid. Input full-width characters.')
      end
      it '名が全角入力でないと登録できない' do
        @user.first_name = 'hanako'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid. Input full-width characters.')
      end
      it 'セイが空では登録できない' do
        @user.family_reading = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family reading can't be blank",
                                                      'Family reading is invalid. Input full-width katakana characters.')
      end
      it 'メイが空では登録できない' do
        @user.first_reading = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First reading can't be blank",
                                                      'First reading is invalid. Input full-width katakana characters.')
      end
      it 'セイが全角カタカナでないと登録できない' do
        @user.family_reading = '山田'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family reading is invalid. Input full-width katakana characters.')
      end
      it 'メイが全角カタカナでないと登録できない' do
        @user.first_reading = 'はなこ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First reading is invalid. Input full-width katakana characters.')
      end
      it '生年月日が空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
