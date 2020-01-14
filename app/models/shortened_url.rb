class ShortenedUrl < ApplicationRecord

    def set_url(url)
        self.long_url = url
        self.short_url = SecureRandom.urlsafe_base64
    end

    belongs_to :User,
        primary_key: :id, 
        foreign_key: :user_id,
        class_name: :User

    def submitter
        self.User
    end

    has_many :Visits,
        primary_key: :short_url,
        foreign_key: :shortened_url,
        class_name: :Visit
    
    def visitors
        self.Visits
    end

    def num_clicks
        self.Visits.length
    end

    def num_uniques
        self.Visits.select(:user_id).distinct.length
    end

    def num_recent_uniques(numMinutes)
        self.Visits.select(:user_id).distinct.where(created_at: (Time.now.utc - numMinutes.minutes)..Time.now.utc).length
    end
    def num_recent(numMinutes)
        self.Visits.select(:user_id).where(created_at: (Time.now.utc - numMinutes.minutes)..Time.now.utc).length
    end
end