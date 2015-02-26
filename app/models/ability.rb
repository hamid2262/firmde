class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new 
    if user.is_admin?
      can :manage, :all
    elsif user.is_editor?
      can [:new, :create, :edit, :update, :index], Block
      can [:show, :index, :new, :create, :edit, :update], Slideshow
      can [:show, :index, :new, :create, :edit, :update, :destroy], Element
      can [:new, :create, :edit, :update, :index], Page
      can [:new, :create, :edit, :update, :index], SubPage
      can [:new, :create, :edit, :update, :index, :destroy], Kunden
    else
      ####  Guest users
      can [:new, :create], User
    end
    
    can [:new, :create], Contact
    can [:show, :index], Blog
    can [:show], Page
    can [:show], SubPage
    can :role, :index, user.has_access?
  end
end
