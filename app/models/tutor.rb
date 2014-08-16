class Tutor < ActiveRecord::Base
  acts_as_user


  has_many :jobs, dependent: :destroy
  has_many :students. through: :jobs
end
