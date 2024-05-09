require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品する' do
    context '出品できるとき' do
      it "入力が正しければ出品できる" do
        expect(@item).to be_valid
      end
    end
    context '出品できないとき' do
      it "画像がないと登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "商品名がないと登録できない" do
        @item.title = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it "商品説明がないと登録できない" do
        @item.text = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it "カテゴリーを未選択だと登録できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "商品の状態が未選択だと登録できない" do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it "配送料の負担が未選択だと登録できない" do
        @item.shipping_id = 1 
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping can't be blank")
      end
      it "発送元が未選択だと登録できない" do
        @item.region_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Region can't be blank")
      end
      it "発送までの日数が未選択だと登録できない" do
        @item.schedule_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Schedule date can't be blank")
      end
      it "価格が空だと登録できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "価格が¥299以下だと登録できない" do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid,half-width numbers only")
      end
      it "価格が¥10000000以上だと登録できない" do
        @item.price = 11111111
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid,half-width numbers only")
      end
      it "価格は全角だと登録できない" do
        @item.price = "５００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid,half-width numbers only")
      end
      it "userが紐付いていない場合は登録できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist", "User can't be blank")
      end
    end
  end
end
