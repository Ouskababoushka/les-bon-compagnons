class AuthenticateAdminController < ApplicationController
  def authenticate_admin!
    authenticate_user!
    redirect_to :root, status: :forbidden unless current_user.admin?
  end
end
