# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  def create
    self.resource = warden.authenticate(auth_options)

    if resource && resource.active_for_authentication?
      render json: { success: true }
    else
      render json: { success: false, errors: resource }
    end
  end

  def destroy
    super
  end
end
