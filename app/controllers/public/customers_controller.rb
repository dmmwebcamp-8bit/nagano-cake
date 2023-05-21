class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!

  def show
  end

  def confirm
  end

  def quit
    customer = current_customer
    customer.update(is_deleated: true)
    reset_session
    redirect_to root_path, notice: "退会手続きが完了しました"
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :phone_number, :postal_code, :address, :is_deleated)
  end

end
