class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :non_purchased_item, only: [:index, :create]

  def index
    @order2 = Order2.new
    if current_user.id == @item.user_id
      redirect_to root_path
    if @item.order != nil
      redirect_to root_path
    end
  end
  end

  def create
    @order2 = Order2.new(order_params)

    if @order2.valid?
        pay_item
       @order2.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order2).permit(:post_code, :place_id, :city, :banti, :building_name, :tel).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

     def non_purchased_item
     @item = Item.find(params[:item_id])
     end
end
