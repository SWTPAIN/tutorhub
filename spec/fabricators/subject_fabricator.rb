Fabricator(:subject) do
  name { Faker::Name.name }
  category_name { Faker::Name.name }
end
