require 'rails_helper'

describe SessionsController do

  describe 'POST create' do

    context 'with valid credential input' do

      # let(:alice) { Fabricate(:tutor, name: 'alice', email: 'alice@example.com', password: 'password') }

      before do

        Fabricate(:tutor, name: 'alice', email: 'alice@example.com', password: 'password')
        xhr :post, :create, format: :json, user: { email: 'alice@example.com',
                                                    password: "password"
                                                   }

      end

      subject(:result) { JSON.parse(response.body) }

      it 'should 200' do
        expect(response.status).to eq(200)
      end

      it 'should return a json object with authorized equal to true' do
        expect(result["authorized"]).to be true
      end

      it 'should return a json object with the user' do
        expect(result["user"]["name"]).to eq('alice')
      end

      # it 'puts the signed in user in the the session' do
      #   expect(session[:user_id]).to eq(alice.id)
      # end

    end

    context 'with invald credential input' do

      before do

        Fabricate(:tutor, name: 'alice', email: 'alice@example.com', password: 'password')
        xhr :post, :create, format: :json, user: { email: 'bob@example.com',
                                                    password: "password"
                                                   }

      end

      subject(:result) { JSON.parse(response.body) }

      it 'should 400' do
        expect(response.status).to eq(400)
      end

      it 'should return a json object with authorized equal to true' do
        expect(result["authorized"]).to be false
      end

      it 'should return a json object with the error message' do
        expect(result["error_message"]).to eq('Email or password is incorrect')
      end

    end

  end

end
