FactoryGirl.define do
  factory :email_link do
   email_subject "cray computer"
   from_email "kegreen22@gmail.com"
   from_name "K Green"
   url "www.nytimes.com"
   title "Cray invents new computer"
   accept_or_rejected_at nil
   accepted nil
   read nil
   trait :unaccepted do
     accepted false
     accept_or_rejected_at DateTime.now
   end
   trait :accepted do
     accepted true
     accept_or_rejected_at DateTime.now
   end

   trait :unread do
      read false
   end

   trait :invalid_url do
     url ""
   end

   factory :accepted_and_unread_email_link, traits: [:accepted, :unread]
   factory :invalid_email_link, traits: [:invalid_url]
  end
end
