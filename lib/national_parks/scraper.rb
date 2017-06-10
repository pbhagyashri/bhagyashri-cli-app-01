class NationalParks::Scraper

  def self.park_scraper
    page = Nokogiri::HTML(open("https://www.national-park.com/category/parks/"))
    parks_title = page.css(".post-title")
    parks_highlight = page.css(".entry p")
    parks_url = page.css(".post-title a").attr("href").value

  end

  def self.details
    doc = Nokogiri::HTML(open("https://www.national-park.com/welcome-to-yosemite-national-park/"))
    titles = doc.css("strong")
    binding.pry
  end


end
