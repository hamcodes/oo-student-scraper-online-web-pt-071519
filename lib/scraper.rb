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
  

    