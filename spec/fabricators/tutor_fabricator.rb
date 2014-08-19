Fabricator(:tutor) do
  name { Faker::Name.name }
  email { Faker::Internet.email}
  password  'password'
  password_confirmation 'password'
  description { Faker::Lorem.paragraph }
  education_level { Faker::Lorem.words }
  institute { Faker::Lorem.words }
end
