class Public::CustomersController < ApplicationController
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
    redirect_to root_path
  end

end
