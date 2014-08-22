require 'rails_helper'

describe SessionsController do

  let(:alice) { Fabricate(:tutor, name: 'alice', email: 'alice@example.com', password: 'password') }

  describe 'POST create' do

    context 'with valid credential input' do

      before do
        xhr :post, :create, format: :json, user: { email: alice.email,
                                                    password: "password" }
      end

      subject(:result) { JSON.parse(response.body) }

      it 'should 200' do
        expect(response.status).to eq(200)
      end

      it 'should return a json object with authorized equal to true' do
        expect(result["success"]).to be true
      end

      it 'should return a json object with the user' do
        expect(result["user"]["name"]).to eq(alice.name)
      end

      # it 'puts the signed in user in the the session' do
      #   expect(session[:user_id]).to eq(alice.id)
      # end

    end

    context 'with invald credential input' do

      before do
        xhr :post, :create, format: :json, user: { email: alice.email,
                                                    password: "wrong_password"
                                                   }
      end

      subject(:result) { JSON.parse(response.body) }

      it 'should 400' do
        expect(response.status).to eq(400)
      end

      it 'should return a json object with authorized equal to true' do
        expect(result["success"]).to be false
      end

      it 'should return a json object with the error message' do
        expect(result["error_message"]).to eq('Email or password is incorrect')
      end

    end

  end

  describe "DELETE destroy" do

    context 'with valid user_id' do

      before do
        session[:user_id] = alice.id
        xhr :post, :destroy, id: alice.id
      end

      subject(:result) { JSON.parse(response.body) }

      it 'should 200' do
        expect(response.status).to eq(200)
      end

      it 'should return a json object with authorized equal to true' do
        expect(result["success"]).to be true
      end
    end

    context 'with invalid user_id' do
      before do
        session[:user_id] = alice.id
        xhr :post, :destroy, id: Fabricate(:tutor).id
      end

      subject(:result) { JSON.parse(response.body) }

      it 'should 400' do
        expect(response.status).to eq(400)
      end

      it 'should return a json object with authorized equal to true' do
        expect(result["success"]).to be false
      end

    end
  end
end
