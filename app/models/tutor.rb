class Tutor < ActiveRecord::Base
  include Userable

  has_many :jobs
  has_many :students, through: :jobs
end
