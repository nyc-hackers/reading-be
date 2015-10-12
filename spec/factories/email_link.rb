FactoryGirl.define do
  factory :emaillink do
     email_subject "cray computer"
     from_email "kegreen22@gmail.com"
     from_name "K Green"
     url "www.nytimes.com"
     title "Cray invents new computer"
  end
end
