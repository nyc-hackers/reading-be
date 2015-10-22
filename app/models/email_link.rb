class EmailLink < ActiveRecord::Base
    validates :title, :url, :from_name, :from_email, :email_subject, presence: true

    def self.undecided
      EmailLink.where(accept_or_rejected_at: nil)

    end

    def self.unread
      EmailLink.where(read: false)

    end

    def self.add_to_reading_list(id)

      EmailLink.find(id).update(accepted: true, accept_or_rejected_at: DateTime.now, read: false)

    end
end
