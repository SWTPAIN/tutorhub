require 'rails_helper'

describe TutorsController do

  render_views

  describe 'GET index' do

    before do
      alice = Fabricate(:tutor, name: 'Alice', featured: true)
      bob = Fabricate(:tutor, name: 'Bob', featured: true)
      xhr :get, :index, format: :json
    end

    subject(:results) { JSON.parse(response.body) }

    def extract_name
      lambda { |person| person["name"] }
    end

    it 'should 200' do
      expect(response.status).to eq(200)
    end

    it 'should return two results' do
      expect(results.size).to eq(2)
    end

    it 'should include "Alice" ' do
      expect(results.map(&extract_name)).to match_array(['Alice', 'Bob'])
    end

  end

  describe 'POST create' do

    context 'with valid input' do

      before do
        xhr :post, :create, format: :json, tutor: { name: "Alice",
                                                    email: 'alice@exmaple.com',
                                                    password: "password",
                                                    password_confirmation: "password",
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
      end

    end

    context 'with invalid input' do

      before do
        xhr :post, :create, format: :json, tutor: { name: "Alice",
                                                    password: "password",
                                                    password_confirmation: "password"
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
