require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @odr_add = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
  end

  describe '購入する' do
    context '購入できるとき' do
      it '正しい入力がされているとき' do
        expect(@odr_add).to be_valid
      end
    end

    context '購入できないとき' do
      it '購入者と紐づいていないとき' do
        @odr_add.user_id = nil
        @odr_add.valid?
        expect(@odr_add.errors.full_messages).to include("User can't be blank")
      end
      it '購入商品と紐づいていない時' do
        @odr_add.item_id = nil
        @odr_add.valid?
        expect(@odr_add.errors.full_messages).to include("Item can't be blank")
      end
      it '郵便番号が空のとき' do
        @odr_add.postcode = ""
        @odr_add.valid?
        expect(@odr_add.errors.full_messages).to include("Postcode can't be blank")
      end
      it '郵便番号が3桁-4桁でないとき' do
        @odr_add.postcode = 1234567
        @odr_add.valid?
        expect(@odr_add.errors.full_messages).to include("Postcode input correctly")
      end
      it '都道府県が選ばれてないとき' do
        @odr_add.region_id = 0
        @odr_add.valid?
        expect(@odr_add.errors.full_messages).to include("Region Select")
      end
      it '市区町村が空のとき' do
        @odr_add.city = ""
        @odr_add.valid?
        expect(@odr_add.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空のとき' do
        @odr_add.house_num = ""
        @odr_add.valid?
        expect(@odr_add.errors.full_messages).to include("House num can't be blank")
      end
      it '電話番号が空のとき' do
        @odr_add.phone = ""
        @odr_add.valid?
        expect(@odr_add.errors.full_messages).to include("Phone can't be blank")
      end
      it '電話番号が9桁以下のとき' do
        @odr_add.phone = 1234567
        @odr_add.valid?
        expect(@odr_add.errors.full_messages).to include("Phone is invalid")
      end
      it '電話番号が12桁以上の時' do
        @odr_add.phone = 123456789012345
        @odr_add.valid?
        expect(@odr_add.errors.full_messages).to include("Phone is invalid")
      end
      it '電話番号が半角数字でないとき' do
        @odr_add.phone = "０９０１２３４５６７８"
        @odr_add.valid?
        expect(@odr_add.errors.full_messages).to include("Phone is invalid")
      end
    end
  end
end
