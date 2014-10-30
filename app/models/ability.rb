class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new 
    if user.is_admin?
      can :manage, :all
    elsif user.is_editor?
    
    else
      ####  Guest users
      can [:new, :create], User
    end
      
    can :role, :index, user.has_access?
  end
end
