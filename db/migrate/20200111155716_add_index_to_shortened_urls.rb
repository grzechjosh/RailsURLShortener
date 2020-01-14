class AddIndexToShortenedUrls < ActiveRecord::Migration[5.2]
  def change
    add_index :shortened_urls, :long_url
    add_index :shortened_urls, :user_id
  end
end
