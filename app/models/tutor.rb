class Tutor < ActiveRecord::Base
  include Userable

  has_many :jobs
  has_many :employers, through: :jobs

  validates_presence_of :description, :education_level, :institute, :gender
end
