class ProductsController < ApplicationController
  before_action :authenticate_admin!,only: [:admin,:create,:edit,:destroy]
  def index
    @search = params[:search]

    @products = Product.all
    @products = @products
      .where("title LIKE ? or body LIKE ?", "%#{@search}%", "%#{@search}%") if @search.present?
    @products = @products.page(params[:page]).per(5)
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to @product
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end


  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to @product
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to action: :index
  end

  private
  def product_params
    params.require(:product).permit(:title, :body, :stock, :server)
  end
end