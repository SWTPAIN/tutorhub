# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

all_subjects = { English: ["English", "English Literature"],
  Chinese: ["Chinese", "Chinese Literature"],
  Mathematics: ["Mathematics", "Mathematics M1", "Mathematics M2"],
  Science: ["Science", "Physics", "Chemistry", "Biology"]
}

all_subjects.each do |k, v|
  v.each do |subject|
    binding.pry
    Subject.create(name: subject, category_name: k)
  end
end
