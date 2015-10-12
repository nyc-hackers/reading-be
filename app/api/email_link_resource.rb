module Listicle
    class  EmailLinkResource < Grape::API
        resource :email_link do
            desc "Get all email links"
            get :all do
                EmailLink.all
            end
        end
    end
end