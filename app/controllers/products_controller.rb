class ProductsController < ApplicationController
    # DRY lookup 
    before_action :set_product, only: %i[ show edit update destroy ]
    allow_unauthenticated_access only: %i[ index show ]

    def index
    end

    def show
        @product
    end

    def edit
    end

    def update
        if @product.update(product_params)
            redirect_to product_path(@product), notice: "Update Success!"
        else
            render :edit, status: :unprocessable_entity
        end
    end

    private
    def set_product
        @product = Product.find(params[:id])
    end

    def product_params
        allowed = params.require(:product).permit(:title, :description, :price_in_dollars, :active)
        if allowed[:price_in_dollars].present?
            allowed[:price_in_cents] = (allowed.delete(:price_in_dollars).to_f * 100).round
        end

        allowed
    end
end
