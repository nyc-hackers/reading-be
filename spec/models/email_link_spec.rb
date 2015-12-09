require 'rails_helper'

RSpec.describe EmailLink, type: :model do
    it "default factory is valid" do
       expect(build(:email_link).valid?).to be_truthy
    end

    it "fails validations with invalid attributes" do
        expect(build(:invalid_email_link).valid?).to be_falsy
    end

    it "returns undecided emails" do
        email1 = build(:email_link)
        email2 = build(:accepted_and_unread_email_link)
        email1.save
        email2.save

        result = EmailLink.undecided

        expect(result).to include(email1)
        expect(result).not_to include(email2)
    end

    it "returns unread emails" do
      email1 = build(:email_link)
      email2 = build(:accepted_and_unread_email_link)
      email1.save
      email2.save

      result = EmailLink.unread

      expect(result).to include(email2)
      expect(result).not_to include(email1)
    end

    it "adds email link to reading list" do
      email1 = build(:email_link)
      email1.save

      result = EmailLink.add_to_reading_list(email1.id)
      email1.reload

      expect(result).to be_truthy
      expect(email1).to have_attributes(accepted: true, read: false)
      expect(email1.accept_or_rejected_at).not_to be_nil
    end

    it "rejects email link from reading list" do
      email1 = build(:email_link)
      email1.save

      result = EmailLink.reject_from_reading_list(email1.id)
      email1.reload

      expect(email1).to have_attributes(accepted: false)
      expect(email1.accept_or_rejected_at).not_to be_nil
    end
end
