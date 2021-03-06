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
        email1 = build(:accepted_and_unread_email_link)
        allow(EmailLink).to receive(:unread).and_return([email1])

        get v1_prefix + "/email_link/unread", format: :json

        resp = jsonify_response(last_response.body)
        expect(resp).to be_kind_of Array
        expect(resp.first["read"]).to eq(false)
      end
    end
  end

  describe "PUT /read/:id" do
    context "when a user has marked a link as read" do
      it "changes the read attribute to true" do
        email1 = build(:accepted_and_unread_email_link)
        email1.save

        put v1_prefix + "/email_link/read/", {id: email1.id}
        email1.reload

        expect(email1.read).to be_truthy
        expect(last_response.status).to eq(200)
      end
    end
  end

  describe "PUT /add_to_reading_list/:id" do
    context "when a user has a link to reading_list" do
      it "changes accepted attribute to true" do
        email1 = build(:email_link)
        email1.save

        put v1_prefix + "/email_link/add_to_reading_list/", {id: email1.id}
        email1.reload

        expect(email1.accepted).to be_truthy
        expect(last_response.status).to eq(200)
      end
    end
  end

  describe "PUT /reject_from_reading_list/:id" do
    context "when a user has rejected a link" do
      it "changes accepted attribute to false" do
        email1 = build(:email_link)
        email1.save

        put v1_prefix + "/email_link/reject_from_reading_list/", {id: email1.id}
        email1.reload

        expect(email1.accepted).to be_falsey
        expect(last_response.status).to eq(200)
      end
    end
  end


end
