class UserMailer < ApplicationMailer

  default from: 'contact@lesbonscompagnons-apero.fr'

  def order_confirmation(user)
    @user = user
    mail(to: @user.email, subject: "Commande Confirmée, Régalez-vous pour l'apéro!")
  end

end
