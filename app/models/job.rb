class Job < ActiveRecord::Base
  belongs_to :student, class: "User"
  belongs_to :tutor, clas: "User"
end
