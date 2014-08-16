class UserProperties < ActiveRecord::Base
  belongs :userable, polymorphic: true, dependent: :destroy

  has_secure_password

  validates_presence_of :eamil, :name

end
