class CreateVisits < ActiveRecord::Migration[5.2]
  def change
    create_table :visits do |t|
      t.timestamps
      t.integer :user_id, null: false
      t.string :shortened_url, null: false
    end
  end
end
