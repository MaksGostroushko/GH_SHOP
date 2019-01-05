class PagesController < ApplicationController

  def show
    @page = SitePage.find(params[:id])
  end
end

  # def index
  #   @pages = Page.all
  # end
  #
  # def show
  #   @page = Page.find(params[:id])
  # end
  #
  # def new
  #   @page = Page.new
  # end
  #
  # def create
  #   @page = Page.new(page_params)
  #     if @page.save
  #       redirect_to @pages
  #     else
  #       render :new
  #     end
  # end
  #
  # def edit
  #   @page = Page.find(params[:id])
  # end
  #
  # def update
  #     if @page.update_attributes(page_params)
  #       redirect_to @page
  #     else
  #       render 'edit'
  #     end
  # end
  #
  # def destroy
  #   @page.destroy!
  #   redirect_to products_path
  # end
  #
  #
  # def payment;end
  #
  # def delivery;end
  #
  # def info;end

# private
#
#   def page_params
#     params.require(:page).permit(:title, :body)
#   end
