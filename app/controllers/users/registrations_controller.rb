# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  def create
    build_resource(sign_up_params)

    if resource.valid?
      resource.save
      sign_in resource
      render json: { success: true }
    else
      @user = resource
      render json: { success: false, errors: resource.errors }
    end
  end

  private

  def sign_up_params
    params.require(:user)
      .permit(
        :first_name,
        :last_name,
        :email, 
        :password, 
        :password_confirmation
      )
  end
end
