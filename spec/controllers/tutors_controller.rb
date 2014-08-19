require 'rails_helper'

describe TutorsController do

  describe 'GET new' do
    it 'set the @tutor variable' do
      xhr :get, :new
      expect(assigns(:tutor)).to be_instance_of (Tutor)
    end
  end

  describe 'GET index' do
    it 'set the @tutors variable' do
      alice = Fabricate(:user)
      bob = Fabricate(:user)
      xhr :get, :index
      expect(assigns(:tutors)).to match_array([alice, bob])
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
