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

      desc "marks email as read"
      put :read do
        email = EmailLink.find(params[:id])
        email.read = true

        email.save

        {status: 200}
      end



    end
  end
end
