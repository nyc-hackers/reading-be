FactoryGirl.define do
  factory :email_link do
     email_subject "cray computer"
     from_email "kegreen22@gmail.com"
     from_name "K Green"
     url "www.nytimes.com"
     title "Cray invents new computer"
     accept_or_rejected nil
     accepted nil
     end


end
