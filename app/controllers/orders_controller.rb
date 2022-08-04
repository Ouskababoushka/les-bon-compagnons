class OrdersController < ApplicationController
  # skip_before_action :authenticate_admin!, only: [ :new, :create, :edit, :update ]

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
    @current_cart.line_items.each do |item|
      @order.line_items << item
      item.cart_id = nil
    end
    @order.save
    Cart.destroy(session[:cart_id])
    session[:cart_id] = nil
    redirect_to orders_path(order_id: @order.id)
  end

  def edit
    @order = Order.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:email, :name, :address)
  end
end
