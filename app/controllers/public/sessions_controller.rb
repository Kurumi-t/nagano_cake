# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :reject_customer, only: [:create]

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

  protected
  def after_sign_in_path_for(resource)
    root_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  def reject_customer
    @customer = Customer.find_by(email: params[:customer][:email])
    if @customer
      if @customer.valid_password?(params[:customer][:password]) &&  (@customer.is_deleted == true)
        flash[:notice] = "退会済みです。再度ご登録をしてご利用ください。"
        redirect_to new_customer_session_path
      else
        flash[:notice] = "項目を入力してください"
      end
    end
  end
  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end