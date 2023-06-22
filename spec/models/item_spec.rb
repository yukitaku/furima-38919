require 'rails_helper'

RSpec.describe Item, type: :model do

 before do
 @item = FactoryBot.build(:item)
 end

 describe 'アイテムの保存' do
  context "アイテムが保存できる場合" do
   it "全ての情報が存在すれば登録できる" do

   expect(@item).to be_valid

   end

  end

 

 context "アイテムが保存できない場合" do

  it "画像がなければ登録できない" do

  @item.image = nil
  @item.valid?
  expect(@item.errors.full_messages).to include("画像を入力してください")

  end

  it "名前が空だとアイテムは保存できない" do
  @item.item_name = ""
  @item.valid?
  
  expect(@item.errors.full_messages).to include("商品名を入力してください")

  end

  it "商品の説明無しだとできない" do
  @item.catch_copy = ""
  @item.valid?
  expect(@item.errors.full_messages).to include("キャッチコピーを入力してください")
  
  end



  it "カテゴリーの無しだとできない" do
  @item.category_id = nil
  @item.valid?
  
  expect(@item.errors.full_messages).to include("カテゴリーを指定してください")

  end

  it "カテゴリー未選択では登録できない" do
  @item.category_id = 1
  @item.valid?
  expect(@item.errors.full_messages).to include("カテゴリーを指定してください")

  end


  it "状態の情報がないと保存できない" do
  @item.condition_id = nil
  @item.valid?

  expect(@item.errors.full_messages).to include("商品の状態を指定してください")

  end

  it "商品の状態未選択では登録できない" do
  @item.condition_id = 1
  @item.valid?
  expect(@item.errors.full_messages).to include("商品の状態を指定してください")

  end

  it "配送料の負担の情報がないと保存できない" do
  @item.period_id = nil
  @item.valid?
  expect(@item.errors.full_messages).to include("配送料の負担を指定してください")

  end

  it "配送料の負担未選択では登録できない" do
  @item.period_id = 1
  @item.valid?
  expect(@item.errors.full_messages).to include("配送料の負担を指定してください")

  end

  it "発送元の地域の情報がないと保存できない" do
  @item.place_id = nil
  @item.valid?
  expect(@item.errors.full_messages).to include("発送元の地域を指定してください")

  end

  it "発送元の地域未選択では登録できない" do
  @item.place_id = 1
  @item.valid?
  expect(@item.errors.full_messages).to include("発送元の地域を指定してください")

  end

  it "発送までの日数の情報がないと保存できない" do
  @item.okuru_id = nil
  @item.valid?
  expect(@item.errors.full_messages).to include("発送までの日数を指定してください")

  end

  it "発送までの日数未選択では登録できない" do
  @item.okuru_id = 1
  @item.valid?
  expect(@item.errors.full_messages).to include("発送までの日数を指定してください")

  end

  it "価格の情報がないとアイテムは保存できない" do
  @item.price = ""
  @item.valid?
  expect(@item.errors.full_messages).to include("販売価格を入力してください")

  end

  it "価格が299円以下だと出品できない" do
  @item.price = 1
  @item.valid?

  expect(@item.errors.full_messages).to include("販売価格は300~9999999のの半角数字を使用してください")

  end
  it "価格が少数だと出品できない" do
    @item.price = 1.1
    @item.valid?
  
    expect(@item.errors.full_messages).to include("販売価格は300~9999999のの半角数字を使用してください")
  
    end

  it "価格が10000000円以上だと出品できない" do
  @item.price = 10000001
  @item.valid?

  expect(@item.errors.full_messages).to include("販売価格は300~9999999のの半角数字を使用してください")

  end

  it "価格が文字では登録できないこと" do
  @item.price = "あ"
  @item.valid?

  expect(@item.errors.full_messages).to include("販売価格は300~9999999のの半角数字を使用してください")

  end
  it "価格が全角数字では登録できないこと" do
    @item.price = "３００"
    @item.valid?
  
    expect(@item.errors.full_messages).to include("販売価格は300~9999999のの半角数字を使用してください")
  end

  it "userが紐づていないと登録できない" do
    @item.user = nil
    @item.valid?
    expect(@item.errors.full_messages).to include('Userを入力してください')
  end
 end
end
end
#binding.pry