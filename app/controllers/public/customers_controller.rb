class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!

  def show
  end

  def edit
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

end
