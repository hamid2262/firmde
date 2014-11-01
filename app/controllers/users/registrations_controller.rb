class Users::RegistrationsController < Devise::RegistrationsController
  layout "admin_layout", only: [:index]
  # def new
  #   super
  # end

  # def create
  #   super
  # end

  def index
    @users = User.order(:updated_at)
  end

  def change_role
    if current_user.is_admin?
      user = User.find(params[:id])
      user.role = params[:role]
      user.save
    end
    redirect_to :back
  end
end
