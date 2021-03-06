require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @user_judge = FactoryBot.build(:order, user_id: user.id, item_id: item.id)
    sleep(0.3)
  end
  context " 新規購入できるとき" do
    it "正常な値の入力確認" do
      expect(@user_judge).to be_valid
    end
    it "建物の名前が入力されているとき" do
      @user_judge.building_name = '創荘'
      expect(@user_judge).to be_valid
    end
    it "建物の名前が入力されていないとき" do
      @user_judge.building_name = ''
      expect(@user_judge).to be_valid
    end
  end
  context 'カード情報に問題がないとき' do
    it "tokenがあれば購入ができること" do
      expect(@user_judge).to be_valid
    end
  end
  context "新規購入できないとき（カード情報以外）" do
    it "配送先の情報として、郵便番号が必須であること" do
      @user_judge.postal_number = ''
      @user_judge.valid?
      expect(@user_judge.errors.full_messages).to include("Postal number can't be blank")
    end
    it "郵便番号の保存にはハイフンが必要であること" do
      @user_judge.postal_number = '1234567'
      @user_judge.valid?
      expect(@user_judge.errors.full_messages).to include("Postal number is invalid. Include hyphen(-)")
    end
    it "配送先の情報として、都道府県が必須であること" do
      @user_judge.prefecture_id = 1
      @user_judge.valid?
      binding.pry
      expect(@user_judge.errors.full_messages).to include("Prefecture can't be blank")
    end
    it "配送先の情報として、市区町村が必須であること" do
      @user_judge.municipality = ''
      @user_judge.valid?
      expect(@user_judge.errors.full_messages).to include("Municipality can't be blank")
    end
    it "配送先の情報として、番地が必須であること" do
      @user_judge.address = ''
      @user_judge.valid?
      expect(@user_judge.errors.full_messages).to include("Address can't be blank")
    end
    it "配送先の情報として、電話番号が必須であること" do
      @user_judge.phone_number = ''
      @user_judge.valid?
      expect(@user_judge.errors.full_messages).to include("Phone number can't be blank")
    end
    it "電話番号は11桁以内の数値のみ保存可能なこと" do
      @user_judge.phone_number = '1234512345123'
      @user_judge.valid?
      expect(@user_judge.errors.full_messages).to include("Phone number 10〜11桁の半角数字のみ有効です")
    end
    it "電話番号が半角数字であること" do
      @user_judge.phone_number = '１２３４５６７８９１２'
      @user_judge.valid?
      expect(@user_judge.errors.full_messages).to include("Phone number 半角数字のみ有効です")
    end
    it "電話番号が英数混合な場合" do
      @user_judge.phone_number = 'abcde123456'
      @user_judge.valid?
      expect(@user_judge.errors.full_messages).to include("Phone number 半角数字のみ有効です")
    end
    it "user_idが存在しないこと" do
      @user_judge.user_id = nil
      @user_judge.valid?
      expect(@user_judge.errors.full_messages).to include("User can't be blank")
    end
    it "item_idが存在しないこと" do
      @user_judge.item_id = nil
      @user_judge.valid?
      expect(@user_judge.errors.full_messages).to include("Item can't be blank")
    end
  end
  context 'カード情報に問題があるとき' do
    it 'tokenに問題があれば購入ができないこと' do
      @user_judge.token = nil
      @user_judge.valid?
      expect(@user_judge.errors.full_messages).to include("Token can't be blank")
    end
  end
end
