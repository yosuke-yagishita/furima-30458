require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録/ユーザー情報' do
    context '新規登録がうまくいくとき' do
      it 'nicknameとemailとpasswordとpassword_confirmationとfamily_name_kanjiと
          first_name_kanjiとfamily_name_kanaとfirst_name_kanaとbirthが存在すれば登録できること' do
        expect(@user).to be_valid
      end
      it 'emailに@が含まれていれば登録できること' do
        @user.email = 'a@a'
        expect(@user).to be_valid
      end
      it 'passwordが６文字以上で半角英数字混合であれば登録できること' do
        @user.password = 'num456'
        @user.password_confirmation = 'num456'
        expect(@user).to be_valid
      end
    end

    context '新規登録ができないとき' do
      it 'nicknameが空では登録できないこと' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できないこと' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailは登録できないこと' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailには@が含まれていないと登録できないこと' do
        @user.email = 'abc.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空では登録できないこと' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordは６文字以上の入力がないと登録できないこと' do
        @user.password = 'Num45'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordは半角英数字混合での入力が必須であること' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
      end
      it 'passwordは確認用含めて２回入力しないと登録できないこと' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordとpassword_confirmationが一致しないと登録できないこと' do
        @user.password_confirmation = 'Num456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
  end

  describe 'ユーザー新規登録/本人情報確認' do
    context '新規登録がうまくいくとき' do
      it 'family_name_kanjiが漢字であれば登録できること' do
        @user.family_name_kanji = '鈴木'
        expect(@user).to be_valid
      end
      it 'family_name_kanjiが全角ひらがなであれば登録できること' do
        @user.family_name_kanji = 'すずき'
        expect(@user).to be_valid
      end
      it 'family_name_kanjiが全角カタカナであれば登録できること' do
        @user.family_name_kanji = 'スズキ'
        expect(@user).to be_valid
      end
      it 'first_name_kanjiが漢字であれば登録できること' do
        @user.first_name_kanji = '太助'
        expect(@user).to be_valid
      end
      it 'first_name_kanjiが全角ひらがなであれば登録できること' do
        @user.first_name_kanji = 'たすけ'
        expect(@user).to be_valid
      end
      it 'first_name_kanjiが全角カタカナであれば登録できること' do
        @user.first_name_kanji = 'タスケ'
        expect(@user).to be_valid
      end
      it 'family_name_kanaが全角カタカナであれば登録できること' do
        @user.family_name_kana = 'スズキ'
        expect(@user).to be_valid
      end
      it 'first_name_kanaが全角カタカナであれば登録できること' do
        @user.first_name_kana = 'タスケ'
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'family_name_kanjiが空では登録できないこと' do
        @user.family_name_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kanji can't be blank")
      end
      it 'first_name_kanjiが空では登録できないこと' do
        @user.first_name_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kanji can't be blank")
      end
      it 'family_name_kanjiが全角ではないと登録できないこと' do
        @user.family_name_kanji = 'ｽｽﾞｷ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name kanji Full-width characters')
      end
      it 'first_name_kanjiが全角ではないと登録できないこと' do
        @user.first_name_kanji = 'ﾀｽｹ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kanji Full-width characters')
      end
      it 'family_name_kanaが空では登録できないこと' do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end
      it 'first_name_kanaが空では登録できないこと' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'family_name_kanaが全角カタカナではないと登録できないこと' do
        @user.family_name_kana = '鈴木'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name kana Full-width katakana characters')
      end
      it 'first_name_kanaが全角カタカナではないと登録できないこと' do
        @user.first_name_kana = '太助'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana Full-width katakana characters')
      end
      it 'birthが空では登録できないこと' do
        @user.birth = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth can't be blank")
      end
    end
  end
end
