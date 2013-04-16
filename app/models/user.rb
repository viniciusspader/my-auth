class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  # attr_accessible :title, :body
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :reset_password_token, :current_password, :roles_mask, :roles

  attr_accessor :current_password

  validates_presence_of :password_confirmation

  ROLES = %w[guest user admin]

  def role?(base_role)
    ROLES.index(base_role.to_s) <= ROLES.index(roles)
  end

  def roles=(roles)
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.inject(0, :+)
  end

  def roles
    ROLES.reject do |r|
      ((roles_mask || 0) & 2**ROLES.index(r)).zero?
    end
  end

  def admin?
    roles.include?('admin')
  end

end
