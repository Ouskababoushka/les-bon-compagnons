class UserMailer < ApplicationMailer

  # def order_confirmation
  #   @order = params[:order]
  #   mail(to: @order.email, subject: "Commande Confirmée, Régalez-vous pour l'apéro!")
  # end

  def new_order_email
    @order = params[:order]

    mail(to: @order.email, bcc: 'valentin.korea@gmail.com', subject: 'Nouvelle Commande Compagnon!')
  end
end
