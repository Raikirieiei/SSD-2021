class OrdersController < ApplicationController

  def index
    @search = params[:search]

    @orders = Order.all
    @orders = @orders
      .where("title LIKE ? or body LIKE ?", "%#{@search}%", "%#{@search}%") if @search.present?
    @orders = @orders.page(params[:page]).per(5)

  end


  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)

    if @order.save
      redirect_to homes_path
    else
      render :new
    end
  end

  def edit
    @order = Order.find(params[:id])
  end


  def update
    @order = Order.find(params[:id])

    if @order.update(order_params)
      redirect_to @order
    else
      render :edit
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to action: :index
  end

  private

  def order_params
    params.require(:order).permit(:product_id, :address)
  end

end