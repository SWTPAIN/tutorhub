class User < ActiveRecord::Base
  belongs_to :userable, polymorphic: true

  has_secure_password

  validates_presence_of :email, :name, :password, :password_confirmation
  validates_uniqueness_of :email
end
