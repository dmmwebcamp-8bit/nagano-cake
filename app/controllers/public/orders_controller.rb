class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
  end

  def complete
  end

  def index
  end

  def show
  end
  
  def create
    
  end
  
  private
    def order_params
      params.require(:order).permit(:payment_method, )
    end
end
