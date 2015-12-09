require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe "GET #home" do
    it "responds sucessfully with HTTP 200 status code" do
      get :welcome

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end
end
