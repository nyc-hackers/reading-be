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
        allow(EmailLink).to receive(:undecided).and_return([])

        #exercise
        get v1_prefix + "/email_link/all", format: :json

        #verifies
        expect(last_response.body).to eq("[]")
      end
    end

    context "when there are links to return" do
      it "returns an array of undecided email_links" do
        #setup
        allow(EmailLink).to receive(:undecided).and_return([
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

  describe "GET /unread" do
    context "when there are unread email_links" do
      it "returns array of accepted and unread email links" do
        email1 = build(:email_link, accepted:true, accept_or_rejected_at: DateTime.now, read: false)
        allow(EmailLink).to receive(:unread).and_return([email1])

        get v1_prefix + "/email_link/unread", format: :json

        resp = jsonify_response(last_response.body)
        expect(resp).to be_kind_of Array
        expect(resp.first["read"]).to eq(false)
      end
    end
  end

  describe "POST /read/:id" do
    context "when a user has marked a link as read" do
      it "changes the read attribute to true" do
        email1 = build(:email_link, accepted: true, accept_or_rejected_at: DateTime.yesterday, read: false)
        email1.save

        put v1_prefix + "/email_link/read/", params: {id: 1}
        email1.reload

        expect(email1.read).to be true
        expect(last_response.status).to eq('200')
      end
    end
  end

end
