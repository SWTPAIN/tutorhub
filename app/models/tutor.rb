class Tutor < ActiveRecord::Base
  include Userable

  has_many :jobs
  has_many :employers, through: :jobs
end
