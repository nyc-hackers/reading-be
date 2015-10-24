module Listicle
  class  EmailLinkResource < Grape::API
    resource :email_link do
      desc "List un-seen links"
      get :all do
        EmailLink.undecided
      end

      desc "fetches unread email links"
      get :unread do
        EmailLink.unread
      end
    end
  end
end
