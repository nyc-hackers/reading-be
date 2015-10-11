module Email_Links
    class  Links < Grape::API
        resource :email_links do
            desc "Get all email links"
            get :all do
                Emaillink.all
            end
        end
    end
end