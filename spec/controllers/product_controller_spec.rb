require 'rails_helper'

describe ProductsController, type: :controller do
  describe "GET index" do
    it "renders the index template" do
      get :index
      expect(response).to have_http_status(:success)
      expect(response).to render_template("index")
    end
  end

end
