require 'rails_helper'

RSpec.describe EmailLink, type: :model do
    it "default factory is valid" do
       expect(build(:email_link).valid?).to be_truthy


    end

    it "fails validations with invalid attributes" do
        expect(build(:email_link, url:"").valid?).to be_falsy
    end

    it "returns undecided emails" do

        email1 = build(:email_link)
        email2 = build(:email_link, accept_or_rejected_at: DateTime.now, accepted: true)

        email1.save
        email2.save

        result = EmailLink.undecided

        expect(result).to include(email1)
        expect(result).not_to include(email2)
    end

    it "returns unread emails" do

      email1 = build(:email_link)
      email2 = build(:email_link, accept_or_rejected_at: DateTime.now, accepted: true, read: false)

      email1.save
      email2.save

      result = EmailLink.unread

      expect(result).to include(email2)
      expect(result).not_to include(email1)

    end

end


#email1 = build(:email_link)
#email2 =  build(:email_link(accepted_or_rejected: Datetime.now, accepted: false)
#expect(EmailLink.undecided).to include(email1)
