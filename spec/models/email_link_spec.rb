require 'rails_helper'

RSpec.describe EmailLink, type: :model do
    it "default factory is valid" do
       expect(build(:email_link).valid?).to be_truthy 
    
  
    end
    
    it "fails validations with invalid attributes" do
        expect(build(:email_link, url:"").valid?).to be_falsy
    end
  # pending "add some examples to (or delete) #{__FILE__}"
end
