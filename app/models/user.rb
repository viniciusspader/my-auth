class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  # attr_accessible :title, :body
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :reset_password_token, :current_password

  attr_accessor :current_password

  def admin?
    false
  end

end
