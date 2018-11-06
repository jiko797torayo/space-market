class Users::RegistrationsController < Devise::RegistrationsController
  layout 'registrations'

  def new
    @user = User.new
  end
end
