module SubjectTaggable
  extend ActiveSupport::Concern

  included do
    has_many :subject_tags, as: :subject_taggable
  end

end
