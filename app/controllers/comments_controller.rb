class CommentsController < ApplicationController
before_action :find_product

  def new
    @comment = Comment.build
  end

  def create
    @comment = @product.comments.create!(comment_params)
    if verify_recaptcha(model: @comment) && @comment.save
      redirect_to @product
      flash[:success] = "Admin check your comment"
    else
      redirect_to @product
      flash[:success] = "Admin check your comment"
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy!
    flash[:danger] = "Comment delete"
    redirect_back(fallback_location: root_path)
  end

  private

  def find_product
    @product = Product.find(params[:product_id])
  end

  def comment_params
    params.require(:comment).permit(:body, :name, :rating, :status)
  end
end
