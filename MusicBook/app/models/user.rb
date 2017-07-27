class User < ApplicationRecord
  has_secure_password

  ROLE_USER = 0
  ROLE_ADMIN = 1
  ROLE_SUPER_ADMIN = 2

  validates_presence_of :username, :email
  validates_uniqueness_of :username, :email

  def admin?
    role == ROLE_ADMIN
  end

  def superadmin?
    role == ROLE_SUPER_ADMIN
  end

end
