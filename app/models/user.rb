class User < ApplicationRecord
    validates :email, presence: true

    has_many :ShortenedUrls,
        primary_key: :id, 
        foreign_key: :user_id,
        class_name: :ShortenedUrl

    def submitted_urls
        self.ShortenedUrls
    end

    has_many :Visits,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :Visit

    def visited_urls
        self.Visits
    end
end