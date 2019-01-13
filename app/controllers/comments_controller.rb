class CommentsController < ApplicationController
before_action :find_product

  def new
    @comment = Comment.build
  end

  def create
    if verify_recaptcha(model: @comment)
      @comment = @product.comments.create!(comment_params)
      redirect_to @product
      flash[:success] = "Admin check your comment"
    else
      redirect_to @product
      # flash[:danger] = "Please,confirm that you are not a robot"
    end
  end

  private

  def find_product
    @product = Product.find(params[:product_id])
  end

  def comment_params
    params.require(:comment).permit(:body, :name, :rating, :status)
  end
end
