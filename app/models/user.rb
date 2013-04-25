class User < ActiveRecord::Base

  before_create :set_default_role

  acts_as_orderer

  has_many :posts

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :reset_password_token, :current_password, :roles_mask, :roles,
                  :cart_cookie

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

  def add_cart_cookie(value, password)
    self.cart_cookie = value
    self.password = password
    self.password_confirmation = password
    self.save
  end

  private

    def set_default_role
      if self.roles.empty?
        self.roles=(%w[user])
      end
    end

  public

    rails_admin do
      label do
        'Usuarios'
      end

      list do
        sort_by :sign_in_count

        field :id
        field :email do
          label 'E-mail'
        end
        field :sign_in_count do
          label '# Acessos'
          sort_reverse true
        end
        field :admin? do
          label 'Administrador?'
          pretty_value do
            value ? 'Sim' : "Nao"
          end
        end
        field :created_at do
          label 'Criado em'
        end
      end
    end

end
