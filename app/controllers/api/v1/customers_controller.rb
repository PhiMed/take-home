class Api::V1::CustomersController < ApplicationController
  def index

  end

  def show

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