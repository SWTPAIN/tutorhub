class User < ActiveRecord::Base

  has_many :jobs, foreign_key: "student_id", dependent: :destroy
  has_many :students, throught: :jobs, source: :student
  has_many :reverse_jobs, foreign_key: "tutor_id", dependent: :destroy
  has_many :tutors, throught: :reverse_jobs, source: :tutor

end
