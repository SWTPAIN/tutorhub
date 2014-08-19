class Job < ActiveRecord::Base

  belongs_to :employer
  belongs_to :tutor

  validates_presence_of :employer_id, :tutor_id
end
