class ShortenUrlController < ApplicationController
  before_action :find_url, only: [:show, :shortened]
  skip_before_action :verify_authenticity_token

  def index
  	@url = ShortenUrl.new
  	@error_msg = params[:error_msg]
  end

  def show
  	redirect_to @url.sanitized_url
  end

  def create
  	@url = ShortenUrl.new
  	@url.original_url = params[:original_url]
  	@url.sanitize

  	if @url.new_url?
	  if @url.save
	    redirect_to shortened_path(@url.short_url)
	  else
		redirect_to action: "index", error_msg: "Error: Saving URL or Invalid URL"
	  end  		
	else
	  flash[:notice] = "Shorten for this URL already exist"
	  redirect_to shortened_path(@url.find_duplicate.short_url)
	end
  end

  def shortened
  	@url = ShortenUrl.find_by_short_url(params[:short_url])
  	host = request.host_with_port
  	@original_url = @url.sanitized_url
  	@short_url = "http://" + host + "/" + @url.short_url
  end

  def fetch_original_url
  	fetch_url = ShortenUrl.find_by_short_url(params[:short_url])
  	redirect_to fetch_url.sanitized_url
  end

  private
  def find_url
  	@url = ShortenUrl.find_by_short_url(params[:short_url])
  end

  def url_params
  	params.require(:url).permit(:original_url)
  end

end
