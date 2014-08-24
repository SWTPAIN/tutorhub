require 'rails_helper'

describe SearchController do

  describe "GET index" do

  context "exact match" do


    it "redirects to " do
      expect(response).to redirect_to
    end
  end

  context "exact match with case insensitive" do
    before { get :index, search: "" }

    it "redirects to " do
      expect(response).to redirect_to
    end
  end
  context "partly match" do

    before { get :index, search: "" }

    it "assigns @results" do
      expect(assigns(:results)).to include()
    end
    it "renders template :index" do
      expect(response).to render_template :index
    end
  end
  context "unmatch" do
    before { get :index, search: "safd" }

    it "assigns @result as empty" do
      expect(assigns(:results)).to eq([])
    end

    it "renders template :index" do
      expect(response).to render_template :index
      end
    end
  end
end
