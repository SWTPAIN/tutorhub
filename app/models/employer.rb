class Employer < ActiveRecord::Base
  include Userable

  has_many :cases
  has_many :jobs
  has_many :tutors, through: :jobs
end
