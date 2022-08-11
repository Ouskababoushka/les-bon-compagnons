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

    if @order.save!
      UserMailer.with(order: @order).new_order_email.deliver_later
      Cart.destroy(session[:cart_id])
      session[:cart_id] = nil
      # UserMailer.order_confirmation(current_user).deliver_now
      flash[:success] = "Merci pour votre commande!"
      redirect_to order_path(@order)
    else
      flash.now[:error] = "Erreur. Merci de vous assurer que le formulaire a été bien remplis"
      render :new
    end
  end

  def edit
    @order = Order.find(params[:id])
  end

  # def order_confirmation
  #   UserMailer.with(order: @order).order_confirmation.deliver_later
  # end

  private

  def order_params
    params.require(:order).permit(:email, :name, :address)
  end
end
