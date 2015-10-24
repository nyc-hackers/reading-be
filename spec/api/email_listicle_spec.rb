require 'rails_helper'

describe "email_listicle_api", type: :api do
  let(:v1_prefix) { "/api/v1" }

  def jsonify_response(response_body)
    JSON.parse(response_body)
  end
  describe "GET /all" do
    context "when no links to return" do
      it "returns and empty array for no links " do
        #setup
        expect(EmailLink).to receive(:undecided).and_return([])

        #exercise
        get v1_prefix + "/email_link/all", format: :json

        #verifies
        expect(last_response.body).to eq("[]")
      end
    end

    context "when there are links to return" do
      it "returns an array of undecided email_links" do
        #setup
        expect(EmailLink).to receive(:undecided).and_return([
          build_stubbed(:email_link)
        ])

        #exercise
        get v1_prefix + "/email_link/all", format: :json

        #verifies
        resp = jsonify_response(last_response.body)
        expect(resp).to be_kind_of Array
        expect(resp.first.keys).to include("email_subject")
      end
    end
  end
end
