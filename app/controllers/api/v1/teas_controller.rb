class Api::V1::TeasController < ApplicationController
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

  def tea_params
    params.permit(:title, :description, :temperature, :brew_time)
  end
end