class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new 
    if user.is_admin?
      can :manage, :all
    elsif user.is_editor?
      can [:new, :create, :edit, :update, :index], Block
      can [:new, :create, :edit, :update, :index], Page
    else
      ####  Guest users
      can [:new, :create], User
    end
    
    can [:show], Page
    can :role, :index, user.has_access?
  end
end
