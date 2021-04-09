require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  context " 新規登録できるとき" do
    it "正常な値の入力確認" do
      expect(@user).to be_valid
    end
  end
  context "新規登録/ユーザー情報が原因でできないとき" do
    it "ニックネームが必須であること" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "メールアドレスが必須であること" do 
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "メールアドレスが一意性であること" do
      @user.save 
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it "メールアドレスは、@を含む必要があること" do
      @user.email = 'emailemail'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it "パスワードが必須であること" do
      @user.password = '' 
      @user.password_confirmation = ''
      @user.valid? 
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "パスワードは、6文字以上での入力が必須であること（6文字が入力されていれば、登録が可能なこと）" do
      @user.password = '12345'
      @user.password_confirmation = '12345'
      @user.valid? 
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "パスワードは、半角英数字混合での入力が必須であること（数字のみ）" do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it "パスワードは、半角英数字混合での入力が必須であること（英語のみ）" do
      @user.password = 'abcdefg'
      @user.password_confirmation = 'abcdefg'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it "パスワードは、確認用を含めて2回入力すること" do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "パスワードとパスワード（確認用）は、値の一致が必須であること" do
      @user.password_confirmation = '23ji45'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  end
  context "新規登録/本人情報確認が原因でできないとき" do
    it "ユーザー本名は、名字が必須であること" do
      @user.family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end
    it "ユーザー本名は、名前が必須であること" do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it "ユーザー本名(名字)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること" do
      @user.family_name = 'jin'
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name 全角文字を使用してください")
    end
    it "ユーザー本名(名前)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること" do
      @user.last_name = 'scotti'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください")
    end
    it "ユーザー本名のフリガナは、名字が必須であること" do
      @user.family_kana_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family kana name can't be blank")
    end
    it "ユーザー本名のフリガナは、名前が必須であること" do
      @user.last_kana_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last kana name can't be blank")
    end
    it "ユーザー本名(名字)のフリガナは、全角（カタカナ）での入力が必須であること" do
      @user.family_kana_name = 'あ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Family kana name 全角カタカナを使用してください")
    end
    it "ユーザー本名(名前)のフリガナは、全角（カタカナ）での入力が必須であること" do
      @user.last_kana_name = 'い'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last kana name 全角カタカナを使用してください")
    end
    it "生年月日が必須であること" do
      @user.birth = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth can't be blank")
    end
  end
end