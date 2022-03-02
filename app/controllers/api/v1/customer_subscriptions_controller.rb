class Api::V1::CustomerSubscriptionsController < ApplicationController
  def index

  end

  def show

  end

  def create
    CustomerSubscription.create(customer_id: params[:customer_id], subscription_id: params[:subscription_id])
  end

  def update

  end

  def destroy
    render json: CustomerSubscription.delete(params[:id])
  end

  private

  def customer_params
    params.permit(:customer_id, :subscription_id)
  end
end