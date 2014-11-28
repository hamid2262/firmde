class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :page_backups
  # has_many :page_backups, :through => :pages

  def is_super_user?
    true if self.email == 'hamid2262@yahoo.com'
  end

  def is_admin?
    true if self.role=="admin" || self.email == 'hamid2262@yahoo.com'
  end

  def is_editor?
    true if self.role=="editor"
  end
  def has_access?
    true if is_admin? or is_editor?
  end

end
