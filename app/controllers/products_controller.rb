class ProductsController < ApplicationController

  def index
    @categories = Category.all
    @products = Product.order(created_at: :desc)
    @order_item = current_order.order_items.build
    @products = @products.search(params[:search]) if params[:search].present?
    @products = @products.where(id: ProductCategory.where(category_id: params[:filter]).pluck(:product_id)) if params[:filter].present?
    @products = @products.where('price >= ?', params[:min_price]) if params[:min_price].present?
    @products = @products.where('price <= ?', params[:max_price]) if params[:max_price].present?
    # @products = Product.paginate(page: params[:page], per_page: 6).search(params[:search])

    # if params[:filter].present?
    #   @products = Product.paginate(page: params[:page], per_page: 6).search(params[:search]).where(id: ProductCategory.where(category_id: params[:filter]).pluck(:product_id))
    # else
    #   @products = Product.order(created_at: :desc)
    #   @products = Product.paginate(page: params[:page], per_page: 6).search(params[:search])
    #   @products = @products.where('price >= ?', params[:min_price]) if params[:min_price].present?
    #   @products = @products.where('price <= ?', params[:max_price]) if params[:max_price].present?
    # end

    respond_to do |format|
      format.html
      format.js
      format.json { render json: @products.pluck(:title) }
    end
  end

  def show
    @product = Product.find(params[:id])
    @comments = @product.comments.where(status: true)

    if cookies[:products].present?
      cookies[:products] += ",#{@product.id}"
    else
      cookies[:products] = @product.id
    end
    @last_products = Product.where(id: cookies[:products].to_s.split(',')).last(4)

    total_rating = @comments.sum(:rating) if @comments.present?
    @avg_rating = (total_rating.to_f / @comments.count.to_f)
  end


  private

  def product_params
    params.require(:product).permit(:title, :price, :result, :description, {pictures: []}, :published, :active)
  end
end
