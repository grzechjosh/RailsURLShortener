class Visit < ApplicationRecord
    validates :user_id, presence: true
    validates :shortened_url, presence: true

    def self.record_visit!(user, url)
        visit = Visit.new
        visit.user_id = user
        visit.shortened_url = url
        visit.save
    end

    belongs_to :User,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :User

    belongs_to :ShortenedUrl,
        primary_key: :short_url,
        foreign_key: :shortened_url,
        class_name: :ShortenedUrl
    
end 