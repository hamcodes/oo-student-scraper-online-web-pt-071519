require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML(open(index_url)).css(".student-card")
    doc.map do |info| 
      name = info.css("h4.student-name").text
      location = info.css("p.student-location").text
      link = info.css("a @href").text
      {:name => name, :location => location, :profile_url => link}
    end
  end
  end

  def self.scrape_profile_page(profile_url)
    
  end

end

