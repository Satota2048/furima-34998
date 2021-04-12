require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  context " 出品情報が保存できるとき" do
    it "正常な値の入力確認" do
      expect(@item).to be_valid
    end
  end
  context "出品情報の保存に失敗したとき" do
    it "商品画像を1枚つけることが必須であること" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it "商品名が必須であること" do
      @item.title = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Title can't be blank")
    end
    it "商品の説明が必須であること" do
      @item.explain = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Explain can't be blank")
    end
    it "カテゴリーの情報が必須であること" do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end
    it "商品の状態についての情報が必須であること" do
      @item.status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Status must be other than 1")
    end
    it "配送料の負担についての情報が必須であること" do
      @item.delivery_fee_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery fee must be other than 1")
    end
    it "発送元の地域についての情報が必須であること" do
      @item.send_from_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Send from must be other than 1")
    end
    it "発送までの日数についての情報が必須であること" do
      @item.cost_day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Cost day must be other than 1")
    end
    it "販売価格についての情報が必須であること" do
      @item.how_much = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("How much can't be blank")
    end
    it "販売価格は、¥300未満ではないこと" do
      @item.how_much = 100
      @item.valid?
      expect(@item.errors.full_messages).to include("How much is not included in the list")
    end
    it "販売価格は、¥9,999,999よりも高額でないこと" do
      @item.how_much = 100000000
      @item.valid?
      expect(@item.errors.full_messages).to include("How much is not included in the list")
    end
    it "販売価格は半角数字のみ保存可能であること" do
      @item.how_much = "１０００"
      @item.valid?
      expect(@item.errors.full_messages).to include("How much 半角数字のみ有効です")
    end
    it "販売価格が少数を含まないこと" do
      @item.how_much = 500.1
      @item.valid?
      binding.pry
      expect(@item.errors.full_messages).to include("How much 半角数字のみ有効です")
    end
  end
end
