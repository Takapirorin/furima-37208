class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def item_params
    params.require(:item).permit(
      :product_name, :explanation, :category_id, :condition_id, :shipping_charge_id, :prefecture_id, :delivery_id, :price, :image
    ).merge(user_id: current_user.id)
  end

end
