require 'rails_helper'

RSpec.describe Emaillink, type: :model do
    it "creates an e-mail link" do
       Emaillink.create!(cnt_title_words:6, email_subject:'cray computer', 
       from_email:'kegreen22@gmail.com', from_name:'K Green', 
       url:'www.nytimes.com', title:'Cray invents new computer', user_id:1) 
        
        expect(Emaillink.count).to eq(1)
    end
end
