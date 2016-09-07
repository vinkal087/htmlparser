class UrlList < ActiveRecord::Base

  def self.parse_url(url_string)
    json = {}
    begin
      doc = Nokogiri::HTML(open(url_string))
      url_list = UrlList.find_by(:url => url_string)
      if(url_list.present?)
        UrlHeader1.where(:url_list => url_list).delete_all
        UrlHeader2.where(:url_list => url_list).delete_all
        UrlHeader3.where(:url_list => url_list).delete_all
        UrlAnchor.where(:url_list => url_list).delete_all
      else
        url_list = UrlList.find_or_create_by(:url => url_string)
      end
      #Insert Lnk Data
      doc.css("a").map do |link|
        if (href = link.attr("href")) && !href.empty?
          if(href.include? 'http')
            UrlAnchor.find_or_create_by(:url_list => url_list, :data => href)
          end
        end
      end

      #Header1 Data
      doc.css("h1").map do |header_data|
        UrlHeader1.find_or_create_by(:url_list => url_list, :data => header_data.text)
      end

      #Header2 Data
      doc.css("h2").map do |header_data|
        UrlHeader2.find_or_create_by(:url_list => url_list, :data => header_data.text)
      end

      #Header2 Data
      doc.css("h3").map do |header_data|
        UrlHeader3.find_or_create_by(:url_list => url_list, :data => header_data.text)
      end
      json[:MSG] = "SUCCESS"
    rescue Exception => e
      json[:error] = e.message
    end
    json
  end

  def get_url_data

    json_data = {}
    data = UrlAnchor.where(:url_list => self).pluck(:data)
    json_data[:links] = data

    data = UrlHeader1.where(:url_list => self).pluck(:data)
    json_data[:h1] = data

    data = UrlHeader2.where(:url_list => self).pluck(:data)
    json_data[:h2] = data

    data = UrlHeader3.where(:url_list => self).pluck(:data)
    json_data[:h3] = data
    json_data
  end
end
