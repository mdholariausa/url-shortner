#requrie 'uri'

class ShortenUrl < ApplicationRecord

  @@url_regex = /\A^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$\z/ix 
  validates :original_url, presence: true, on: :create
  validates_format_of :original_url, with: @@url_regex
  before_create :generate_short_url
  before_create :sanitize

  def generate_short_url
    url = ([*('a'..'z'),*('0'..'9')]).sample(6).join
  	old_url = ShortenUrl.where(short_url: url).last
  	if old_url.present?
  	  self.generate_short_url
  	else
  	  self.short_url = url
  	end
  end

  def find_duplicate
  	ShortenUrl.find_by_sanitized_url(self.sanitized_url)
  end

  def new_url?
  	find_duplicate.nil?
  end

  def sanitize
  	self.original_url.strip!
  	self.sanitized_url = self.original_url.downcase
  end
end
