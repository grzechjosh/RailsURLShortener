class AddIndexToVisits < ActiveRecord::Migration[5.2]
  def change
    add_index :visits, :shortened_url
    add_index :shortened_urls, :short_url 
  end
end
