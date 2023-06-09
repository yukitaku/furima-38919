require 'rails_helper'

RSpec.describe Order2, type: :model do
  describe '配送先情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
    @order2 = FactoryBot.build(:order2 ,user_id: user.id,item_id: item.id)
  end


    context '配送先情報の保存ができるとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order2).to be_valid
      end
      it 'user_idが空でなければ保存できる' do
        @order2.user_id = 1
        expect(@order2).to be_valid
      end
      it 'item_idが空でなければ保存できる' do
        @order2.item_id = 1
        expect(@order2).to be_valid
      end
      it '郵便番号が「3桁と-と4桁」の組み合わせであれば保存できる' do
        @order2.post_code = '123-4560'
        expect(@order2).to be_valid
      end
      it '都道府県空でなければ保存できる' do
        @order2.place_id = 1
        expect(@order2).to be_valid
      end
      it '市区町村が空でなければ保存できる' do
        @order2.city = '横浜市緑区'
        expect(@order2).to be_valid
      end
      it '番地が空でなければ保存できる' do
        @order2.banti = '青山1-1-1'
        expect(@order2).to be_valid
      end
      it '建物名が空でも保存できる' do
        @order2.building_name = nil
        expect(@order2).to be_valid
      end
      it '電話番号が11番桁以内かつ-なしであれば保存できる' do
        @order2.tel = '12341234123'
        expect(@order2).to be_valid

      end
    end
  
    context '配送先情報の保存ができないとき' do
      it 'user_idが空だと保存できない' do
        @order2.user_id = nil
        @order2.valid?
        expect(@order2.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと保存できない' do
        @order2.item_id = nil
        @order2.valid?

        expect(@order2.errors.full_messages).to include("Item can't be blank")
      end
      it '郵便番号が空だと保存できないこと' do
        @order2.post_code = nil
        @order2.valid?
        expect(@order2.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号にハイフンがないと保存できないこと' do
        @order2.post_code = 111_1111
        @order2.valid?
        expect(@order2.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it '都道府県が「---」だと保存できないこと' do
        @order2.place_id = 0
        @order2.valid?
        expect(@order2.errors.full_messages).to include("Place can't be blank")
      end
      it '都道府県が空だと保存できないこと' do
        @order2.place_id = nil
        @order2.valid?
        expect(@order2.errors.full_messages).to include("Place can't be blank")
      end
      it '市区町村が空だと保存できないこと' do
        @order2.city = nil
        @order2.valid?
        expect(@order2.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと保存できないこと' do
        @order2.banti = nil
        @order2.valid?
        expect(@order2.errors.full_messages).to include("Banti can't be blank")
      end
      it '電話番号が空だと保存できないこと' do
        @order2.tel = nil
        @order2.valid?
        expect(@order2.errors.full_messages).to include("Tel can't be blank")
      end
      it '電話番号にハイフンがあると保存できないこと' do
        @order2.tel = '123 - 1234 - 1234'
        @order2.valid?
        expect(@order2.errors.full_messages).to include('Tel is invalid')
      end
      it '電話番号が12桁以上あると保存できないこと' do
        @order2.tel = 12_345_678_910_123_111
        @order2.valid?
        expect(@order2.errors.full_messages).to include('Tel is invalid')
      end
      it '電話番号が9桁以下あると保存できないこと' do
        @order2.tel = 12_345_678
        @order2.valid?
        expect(@order2.errors.full_messages).to include('Tel is invalid')
      end
      it 'トークンが空だと保存できないこと' do
        @order2.token = nil
        @order2.valid?
        expect(@order2.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
