class OrdersController < ApplicationController
  skip_before_action :authenticate_admin!, only: [ :new, :create, :edit, :update ]

  def index
    @orders = Order.all
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
      redirect_to order_path(@order)
    else
      render :new
    end
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to order_path(@order)
  end

  def destroy
    @order = Order.find(params[:id])
    @order.requests.delete_all
    @order.delete
    redirect_to :root
  end

  private

  def order_params
    params.require(:order).permit(:user, :products, :total_price, :address)
  end
end
