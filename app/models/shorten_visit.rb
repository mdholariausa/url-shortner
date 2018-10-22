class ShortenVisit < ApplicationRecord
  has_one :shorten_urls
  def total_visits
  	# ShortenVisit.joins(:shorten_urls).select("*")
  	ShortenVisit.joins("JOIN shorten_urls ON shorten_urls.short_url = shorten_visits.short_url")
  	  .select("shorten_urls.sanitized_url as sanitized_url, count(*) as visits")
  	  .group("shorten_urls.sanitized_url")
  end
end
