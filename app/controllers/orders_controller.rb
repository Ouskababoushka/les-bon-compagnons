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
    @order.save!
    Cart.destroy(session[:cart_id])
    session[:cart_id] = nil
    UserMailer.order_confirmation(current_user).deliver_now
    redirect_to order_path(@order)
  end

  def edit
    @order = Order.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:email, :name, :address)
  end
end
