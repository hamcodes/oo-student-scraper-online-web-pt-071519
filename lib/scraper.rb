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
    profile_hash = {}
    doc = Nokogiri::HTML(open(profile_url))
    links = doc.css(".social-icon-container a").map{|link| link['href']}
    links.each do |link|
      if link.include?("twitter")
        profile_hash[:twitter] = link
      elsif link.include?("linkedin")
        profile_hash[:linkedin] = link
      elsif link.include?("github")
        profile_hash[:github] = link
      elsif link.include?(".com")
        profile_hash[:blog] = link
      end
    end
    profile_hash[:profile_quote] = doc.css(".profile-quote").text
    profile_hash[:bio] = doc.css(".bio-content .description-holder").text.strip
    profile_hash
  end

end