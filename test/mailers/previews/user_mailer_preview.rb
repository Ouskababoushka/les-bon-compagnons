# Preview all emails at http://localhost:3000/rails/mailers/user_mailer/new_order_email
class UserMailerPreview < ActionMailer::Preview

  # def order_confirmation
  #   UserMailer.with(order: order).order_confirmation
  # end

  def new_order_email
    # Set up a temporary order for the preview
    # order = Order.new(name: "Joe Smith", email: "joe@gmail.com", address: "1-2-3 Chuo, Tokyo, 333-0000")

    UserMailer.with(order: order).new_order_email
  end
end
