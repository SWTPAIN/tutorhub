require 'rails_helper'

describe TutorsController do

  describe 'GET index' do
    before do
      alice = Fabricate(:tutor, name: 'Alice')
      bob = Fabricate(:tutor, name: 'Bob')
      xhr :get, :index, format: :json
    end

    subject(:results) { JSON.parse(response.body) }

    it 'should 200' do
      expect(resposne.status)
    end

    it 'should return two results' do
      expect(results.size).to eq(2)
    end

    it 'should include "Alice" ' do
      expect(results.map(&:name)).to match_array(['Alice', 'Bob'])
    end

  end


  # describe 'POST create' do
  #   context 'with successful user registration' do
  #       before do
  #         xhr :post, :create, user: Fabricate.attributes_for(:user)
  #       end
  #     it "redirects to sign in template" do
  #       expect(response).to redirect_to sign_in_path
  #     end
  #     it 'set the flash info' do
  #       expect(flash[:info]).to be_present
  #     end
  #   end
  # end

end
