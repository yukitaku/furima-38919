class ItemsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
   before_action :set_item, only: [:show, :edit, :update,]
  def index

    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
   def show
    @item = Item.find(params[:id])
   end

   def edit
    @item = Item.find(params[:id])
   end
 
   def update

     if @item.update(item_params)
       redirect_to item_path(@item)
     else
       render :edit
     end
   end

  # def destroy
  #   if @item.destroy
  #     redirect_to root_path
  #   else
  #     redirect_to root_path
  #   end
  # end


  private

  def item_params
   params.require(:item).permit(:item_name, :catch_copy, :category_id, :condition_id, :period_id, :place_id,:okuru_id,:price, :image).merge(user_id: current_user.id)
  end

    def set_item
     @item = Item.find(params[:id])
    end

  def contributor_confirmation
   redirect_to root_path unless current_user == @item.user
  end
end
