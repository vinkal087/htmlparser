class HtmlOperationsController < ApplicationController
  require 'open-uri'
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }

  def parse_url
    url_string = params[:url]
    json = {}
    if(! (uri?(url_string)))
      json = customized_error("INVALID_URL","URL is not valid")
    else
      json = UrlList.parse_url(url_string)
    end
    render :json => json
   # respond_to do |format|
   #   format.json { render :json => json }
   # end
  end

  def get_url_data
    url_string = params[:url]
    puts url_string
    url_list = UrlList.find_by(:url => url_string)
    json_data = {}
    if(!url_list.present?)
      json_data[:error] = "Please Check The URL passed. This URL is not present"
    else
      json_data = url_list.get_url_data
    end
    render :json => json_data
    #respond_to do |format|
    #  format.json { render :json => json_data }
    #end
  end

  def get_url_list
    json_data = UrlList.all.pluck(:url)
    render :json => json_data
  end

  def uri?(string)
      uri = URI.parse(string)
    %w( http https ).include?(uri.scheme)
  rescue URI::BadURIError
    false
  rescue URI::InvalidURIError
    false
  end

  def customized_error(error_id,error_msg)
    err = {}
    err["error_id"] = error_id
    err["error_msg"] = error_msg
    err
  end
end
