class User < ActiveRecord::Base
  belongs_to :userable, polymorphic: true

  has_secure_password

  validates_presence_of :eamil, :name, :password, :password_confirmation
end
