class SubjectTag < ActiveRecord::Base

  belongs_to :subject
  belongs_to :subject_taggable, polymorphic: true

end
