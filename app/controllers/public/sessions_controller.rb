# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :customer_state, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  protected

  def customer_state
    @customer = Customer.find_by(email: params[:customer][:email])
    return if !@customer

    if @customer.valid_password?(params[:customer][:password]) && @customer.is_deleated
      flash[:notice] = "退会済みの為、再度ご登録してご利用ください"
      redirect_to new_customer_registration_path
    end
  end

end
