require "rails_helper"

describe UsersController do

  describe 'POST create' do
    context 'employer sign up' do
      context 'with valid input' do

        before do
          xhr :post, :create, format: :json, user: { name: "Alice",
                                                      email: 'alice@exmaple.com',
                                                      password: "password",
                                                      password_confirmation: "password"
                                                     }
        end

        it 'should 200' do
          expect(response.status).to eq(201)
        end

        it 'should create a employer' do
          expect(Employer.last.name).to eq("Alice")
          expect(Employer.last.email).to eq("alice@exmaple.com")
        end

      end

      context 'with invalid input' do

        before do
          xhr :post, :create, format: :json, user: { name: "Alice",
                                                      password: "password",
                                                      password_confirmation: "password"
                                                     }
        end

        it 'should 400' do
          expect(response.status).to eq(400)
        end

        it 'should not create a tutor' do
          expect(Employer.all.size).to eq(0)
        end

      end
    end

    context 'tutor sign up' do
      context 'with valid input' do

        before do

          all_subjects = { English: ["English", "English Literature"],
            Chinese: ["Chinese", "Chinese Literature"]
          }

          all_subjects.each do |k, v|
            v.each do |subject|
              Subject.create(name: subject, category_name: k)
            end
          end

          xhr :post, :create, format: :json, user: { name: "Alice",
                                                      email: 'alice@exmaple.com',
                                                      password: "password",
                                                      password_confirmation: "password",
                                                      subjects: ["English", "Chinese"],
                                                      description: 'I am a good teacher',
                                                      education_level: 'Bachelor',
                                                      institute: 'HKU'
                                                     }
        end

        it 'should 200' do
          expect(response.status).to eq(201)
        end

        it 'should create a tutor' do
          expect(Tutor.last.name).to eq("Alice")
          expect(Tutor.last.institute).to eq("HKU")
          expect(Tutor.last.subjects).to match_array(["English", "Chinese"])
        end

      end

      context 'with invalid input' do

        before do
          xhr :post, :create, format: :json, user: { name: "Alice",
                                                      password: "password",
                                                      password_confirmation: "password",
                                                      subjects: ["English", "Chinese"]
                                                   }
        end

        it 'should 400' do
          expect(response.status).to eq(400)
        end

        it 'should not create a tutor' do
          expect(Tutor.all.size).to eq(0)
        end

      end
    end
  end

end
