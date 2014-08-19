class Tutor < ActiveRecord::Base
  include Userable

  has_many :jobs
  has_many :employers, through: :jobs

  validates_presence_of :description, :education_level, :institute


  def set_featured
    update_attribute(:featured, true)
  end

  def set_not_featured
    update_attribute(:featured, false)
  end

end
