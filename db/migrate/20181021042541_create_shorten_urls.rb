class CreateShortenUrls < ActiveRecord::Migration[5.2]
  def change
    create_table :shorten_urls do |t|
      t.text :original_url
      t.string :short_url
      t.text :sanitized_url
      t.timestamps
    end
  end
end
