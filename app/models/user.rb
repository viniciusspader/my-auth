class User < ActiveRecord::Base

  before_create :set_default_role

  acts_as_orderer

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

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

  private

    def set_default_role
      if self.roles.empty?
        self.roles=(%w[user])
      end
    end

end
