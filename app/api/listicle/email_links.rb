module Email_Links
    class  Links < Grape::API
        resource :email_links do
            desc "Get all email links"
            get :all do
                Emaillink.create!(cnt_title_words:6, email_subject:'cray computer', 
                from_email:'kegreen22@gmail.com', from_name:'K Green', 
                url:'www.nytimes.com', title:'Cray invents new computer', user_id:1) 
            end
        end
    end
end