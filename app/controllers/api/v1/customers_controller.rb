class Api::V1::CustomersController < ApplicationController
  def index

  end

  def show
    if Customer.exists?(params[:id])
      render json: CustomerSerializer.new(Customer.find(params[:id]))
    else
      render json: {errors: {details: "Not Found"}}, status: 404
    end
  end

  def create

  end

  def update

  end

  def destroy

  end

  private

  def customer_params
    params.permit(:first_name, :last_name, :email, :address)
  end
end