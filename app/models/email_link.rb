class EmailLink < ActiveRecord::Base
    validates :title, :url, :from_name, :from_email, :email_subject, presence: true
end
