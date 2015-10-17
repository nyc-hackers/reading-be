class EmailLink < ActiveRecord::Base
    validates :title, :url, :from_name, :from_email, :email_subject, presence: true

    def self.undecided
      EmailLink.where(accept_or_rejected_at: nil)

    end
end
