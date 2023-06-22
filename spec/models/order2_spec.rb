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
        @order2.place_id = 2
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
        expect(@order2.errors.full_messages).to include("Userを入力してください")
      end
      it 'item_idが空だと保存できない' do
        @order2.item_id = nil
        @order2.valid?
        
        expect(@order2.errors.full_messages).to include("Itemを入力してください")
      end
      it '郵便番号が空だと保存できないこと' do
        @order2.post_code = nil
        @order2.valid?
        expect(@order2.errors.full_messages).to include("郵便番号を入力してください")
      end
      it '郵便番号にハイフンがないと保存できないこと' do
        @order2.post_code = 111_1111
        @order2.valid?
        expect(@order2.errors.full_messages).to include('郵便番号が無効です')
      end
      it '都道府県が「---」だと保存できないこと' do
        @order2.place_id = 1
        @order2.valid?
        expect(@order2.errors.full_messages).to include("都道府県を入力してください")
      end
      it '都道府県が空だと保存できないこと' do
        @order2.place_id = nil
        @order2.valid?
        expect(@order2.errors.full_messages).to include("都道府県を入力してください")
      end
      it '市区町村が空だと保存できないこと' do
        @order2.city = nil
        @order2.valid?
        expect(@order2.errors.full_messages).to include("市区町村を入力してください")
      end
      it '番地が空だと保存できないこと' do
        @order2.banti = nil
        @order2.valid?
        expect(@order2.errors.full_messages).to include("番地を入力してください")
      end
      it '電話番号が空だと保存できないこと' do
        @order2.tel = nil
        @order2.valid?
        expect(@order2.errors.full_messages).to include("電話番号を入力してください")
      end
      it '電話番号にハイフンがあると保存できないこと' do
        @order2.tel = '123 - 1234 - 1234'
        @order2.valid?
        expect(@order2.errors.full_messages).to include('電話番号が無効です')
      end
      it '電話番号が12桁以上あると保存できないこと' do
        @order2.tel = 12_345_678_910_123_111
        @order2.valid?
        expect(@order2.errors.full_messages).to include('電話番号が無効です')
      end
      it '電話番号が9桁以下あると保存できないこと' do
        @order2.tel = 12_345_678
        @order2.valid?
        expect(@order2.errors.full_messages).to include('電話番号が無効です')
      end
      it 'トークンが空だと保存できないこと' do
        @order2.token = nil
        @order2.valid?
        expect(@order2.errors.full_messages).to include("クレジットカード情報入力を入力してください")
      end
    end
  end
end
# binding.pry