class Job < ActiveRecord::Base

  belongs_to :employer
  belongs_to :tutor
end
