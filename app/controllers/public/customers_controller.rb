class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!

  def show
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      flash[:notice] = "会員情報を更新しました"
      redirect_to customers_path
    else
      render :edit
    end
  end

  def confirm
  end

  def quit
    customer = current_customer
    customer.update(is_deleated: true)
    reset_session
    flash[:notice] = "退会手続きが完了しました"
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :phone_number, :postal_code, :address, :is_deleated)
  end

end
