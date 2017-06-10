class NationalParks::Scraper
  attr_accessor :page

  def self.park_scraper
    page = Nokogiri::HTML(open("https://www.national-park.com/category/parks/"))
    parks_title = page.css(".post-title").first.text
    parks_highlight = page.css(".entry p").first.text
    #parks_url = page.css(".post-title a").attr("href").value
    new_park = NationalParks::Park.new(parks_title, parks_highlight)
    binding.pry
  end

  def self.details
    doc = Nokogiri::HTML(open("https://www.national-park.com/welcome-to-yosemite-national-park/"))
    titles = doc.css("strong")
    binding.pry
  end


end
