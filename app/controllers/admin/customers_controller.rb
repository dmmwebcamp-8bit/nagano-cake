class Admin::CustomersController < ApplicationController
    before_action :authenticate_admin!

  def index
    @customers = Customer.page(params[:page]).per(10)
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to admin_customers_path, notice: "会員情報を更新しました"
    else
      render :edit
    end
  end

  def order_history
    @customer = Customer.find(params[:customer_id])
    @orders = @customer.orders.order(created_at: "DESC").page(params[:page]).per(10)
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :phone_number, :postal_code, :address, :is_deleated)
  end

end
