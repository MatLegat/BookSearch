# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController

  # Automatically aprove only first user:
  def sign_up_params
    p = params.require(:user).permit(:display_name, :email, :password, :password_confirmation)
    p[:approved] = User.where(approved: true).empty?
    p
  end

end
