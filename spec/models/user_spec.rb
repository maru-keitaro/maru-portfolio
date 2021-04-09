require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

    describe 'ユーザー管理' do
      context '正常系' do
        it '全ての項目が存在すればできる' do
          expect(@user).to be_valid
        end

        it 'nicknameが6文字以下であれば登録できる' do
          @user.nickname = "12345a"
          expect(@user).to be_valid
        end

        it 'passwordが6文字以上であれば登録できる' do
          @user.password = "123456a"
          @user.password_confirmation = "123456a"
          expect(@user).to be_valid
        end
      end

      context '異常系' do
        it 'nicknameが空では登録できない' do
          @user.nickname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("ニックネームを入力してください")
        end

        it 'nicknameが7文字以上では登録できない' do
          @user.nickname = '123aaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include("ニックネームは6文字以内で入力してください")
        end

        it 'emailが空では登録できない' do
          @user.email = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("メールアドレスを入力してください")
        end

        it '重複したemailが存在する場合登録できない' do
          @user.save
          another_user = FactoryBot.build(:user)
          another_user.email = @user.email
          another_user.valid?
          expect(another_user.errors.full_messages).to include("メールアドレスはすでに存在します")
        end

        it 'passwordが空では登録できない' do
          @user.password = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("パスワードを入力してください")
        end

        it 'password_confirmationが空では登録できない' do
          @user.password_confirmation = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
        end

        it 'passwordが存在してもpassword_confirmationがない場合は登録できないこと' do
          @user.password_confirmation = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
        end

        it 'passwordが5文字以下では登録できない' do
          @user.password = 'aaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
        end
      end
    end
end
