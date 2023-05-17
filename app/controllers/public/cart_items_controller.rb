class Public::CartItemsController < ApplicationController

  def index
    @cart_items = current_customer.cart_items
    @total = 0
  end

  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(amount: cart_item_params[:amount])
    redirect_to cart_items_path
  end

  def destroy
    CartItem.find(params[:id]).destroy
    redirect_to cart_items_path
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end

  def create
    cart_item = current_customer.cart_items.new(cart_item_params)
    if cart_item.save
      redirect_to cart_items_path
    else
      render request.referer
    end
  end

  private
    def cart_item_params
      params.require(:care_item).permit(:item_id, :amount)
    end

    def subtotal
        item.with_tax_price * amount
    end

end
