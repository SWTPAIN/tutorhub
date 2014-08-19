class User < ActiveRecord::Base
  belongs_to :userable, polymorphic: true
  has_many :jobs, foreign_key: "student_id"
  has_many :tutors, through: :jobs

  has_secure_password

  validates_presence_of :email, :name, :password, :password_confirmation
end
