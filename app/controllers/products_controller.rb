class ProductsController < ApplicationController
  before_action :set_product, only: [ :show, :edit, :update, :destroy ]

  def index
    @order_item = current_order.order_items.new
      if params[:search]
        @products = Product.search(params[:search]).order(created_at: :desc)
      else
        @products = Product.all.order(created_at: :desc)
      end
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
      if @product.save
        flash[:success] = "Product created!"
        redirect_to @product
      else
        flash[:danger] = "New product don't create"
        render :new
      end
  end

  def edit
  end

  def update
      if @product.update_attributes(product_params)
        flash[:success] = "Product was updated"
        redirect_to @product
      else
        render 'edit'
      end
  end

  def destroy
    @product.destroy!
    flash[:success] = "Product destroy"
    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:title, :price, :result, :description, {pictures: []}, :published)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
