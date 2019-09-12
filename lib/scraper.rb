require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    students = Nokogiri::HTML(open(index_url)).css(".student-card")
    check = students.map do |student|
      link = student.css('a @href').text
      name = student.css(".student-name").text
      location = student.css(".student-location").text
      {name: name, location: location, profile_url: link}
    end
  end
  

    def self.scrape_profile_page(profile_url)
    hash = {}
    doc = Nokogiri::HTML(open(profile_url))
    links = doc.css(".social-icon-container a").map{|link| link['href']}
    links.each do |link|
      if link.include?("twitter")
        hash[:twitter] = link
      elsif link.include?("linkedin")
        hash[:linkedin] = link
      elsif link.include?("github")
        hash[:github] = link
      elsif link.include?(".com")
        hash[:blog] = link
      end
    end
    hash[:profile_quote] = doc.css(".profile-quote").text
    hash[:bio] = doc.css(".bio-content .description-holder").text.strip
    hash
  end

end