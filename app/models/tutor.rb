class Tutor < ActiveRecord::Base
  include Userable
  #include SubjectTaggable
  has_many :subject_tags, as: :subject_taggable

  has_many :jobs
  has_many :employers, through: :jobs
  has_many :subjects

  validates_presence_of :description, :education_level, :institute


  def set_featured
    update_attribute(:featured, true)
  end

  def set_not_featured
    update_attribute(:featured, false)
  end

  def subjects_taught

  end

end
