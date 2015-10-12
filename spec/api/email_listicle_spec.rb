require 'rails_helper'

describe "email_listicle_api", type: :api do
  describe "GET /all" do
      it "returns and empty array for no links " do
            
          #exercise
          get "/api/v1/email_links/all.json"
           
          #verifies
          expect(last_response.body).to eq("[]")
      end
       
       
       
  end
    
    
    
    
    
end