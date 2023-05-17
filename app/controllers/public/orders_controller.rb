class Public::OrdersController < ApplicationController

  def new
  end

  def confirm
    @order = Order.new
    @cart_items = current_customer.cart_items
    @payment_method = params[:payment_method]
    @total = 0
    @shipping_cost = 800
    case  params[:address_option]
    when "1"
      @postal_code = current_customer.postal_code
      @address = current_customer.address
      @name = current_customer.full_name
    when "2"
      address = Address.find(params[:address_id])
      @postal_code = address.postal_code
      @address = address.address
      @name = address.name
    else
      @postal_code = params[:postal_code]
      @address = params[:address]
      @name = params[:name]
    end
  end

  def complete
  end

  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    order = current_customer.orders.new(order_params)
    if order.save
      current_customer.cart_items.each do |cart_item|
        detail = order.order_details.new()
        detail.item_id  = cart_item.item_id
        detail.price    = cart_item.item.with_tax_price
        detail.quantity = cart_item.amount
        detail.save
      end
      current_customer.cart_items.destroy_all
      redirect_to orders_complete_path
    else
      render request.referer
    end
  end

  private
    def order_params
      params.require(:order).permit(:payment_method, :total_cost, :shipping_cost, :postal_code, :address, :name)
    end
end
