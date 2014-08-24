require 'rails_helper'

describe TutorsController do

  render_views

  describe 'GET featured_tutors' do

    before do
      alice = Fabricate(:tutor, name: 'Alice', featured: true)
      bob = Fabricate(:tutor, name: 'Bob', featured: true)
      xhr :get, :featured_tutors, format: :json
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


  describe 'GET index' do

    before do
      alice = Fabricate(:tutor, name: 'Alice', featured: true)
      bob = Fabricate(:tutor, name: 'Bob', featured: true)
      c = Fabricate(:tutor, name: 'C', featured: false)
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
      expect(results.size).to eq(3)
    end

    it 'should include "Alice" ' do
      expect(results.map(&extract_name)).to match_array(['Alice', 'Bob', 'C'])
    end
  end
end
