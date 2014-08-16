class Student < ActiveRecord::Base
  acts_as_user

  has_many :jobs, dependent: :destroy
  has_many :tutors, through: :jobs
end
