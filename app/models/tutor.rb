class Tutor < ActiveRecord::Base
  include Userable
  #include SubjectTaggable
  has_many :subject_tags, as: :subject_taggable

  has_many :jobs
  has_many :employers, through: :jobs
  has_many :subjects

  validates_presence_of :description, :education_level


  def set_featured
    update_attribute(:featured, true)
  end

  def set_not_featured
    update_attribute(:featured, false)
  end

  def subjects=(subjects)
    subjects.each do |subject|
      if subject = Subject.find_by(name: subject)
        subject_tags.create(subject: subject)
      end
    end
  end

  def subjects
    subject_tags.map(&:subject).map(&:name)
  end

end
