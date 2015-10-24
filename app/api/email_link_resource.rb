module Listicle
    class  EmailLinkResource < Grape::API
        resource :email_link do
            desc "List un-seen links"
            get :all do
                EmailLink.undecided
            end
        end
    end
end
