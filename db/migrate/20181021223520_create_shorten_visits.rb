class CreateShortenVisits < ActiveRecord::Migration[5.2]
  def change
    create_table :shorten_visits do |t|
      t.string :short_url
      t.string :from_ip
      t.text :user_agent
      t.timestamps
    end
  end
end
