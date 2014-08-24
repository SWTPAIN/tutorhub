require 'pry'; binding.pry

json.array! @featured_tutors, partial: 'tutor', as: :tutor
