class V1::SessionsController < ApplicationController

  def log_in
    @user = User.where(email: params[:email]).last
    byebug

    if @user && @user.valid_password?(params[:password])
      render status: :created
    else
      render json: { errors: { 'email or password' => ['is invalid'] } }, status: :unprocessable_entity
    end
  end

  def log_out
    current_user&.authentication_token = nil
    if current_user.save
      head(:ok)
    else
      head(:unauthorized)
    end
  end

  def sign_up
    @user = User.new(user_params)
    if @user.save
      render json: {message: "User has been registered"}, status: :created

    else
      render json: { errors: { 'email or password' => ['is invalid'] } }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :shipping_address)
  end

end
