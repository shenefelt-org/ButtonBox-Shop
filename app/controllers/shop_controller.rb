class ShopController < ApplicationController
  allow_unauthenticated_access
  def index
    @products = Product.all
  end

  def show
  end

  def create
  end

  def edit
  end

  def new
  end

  def destroy
  end
end
