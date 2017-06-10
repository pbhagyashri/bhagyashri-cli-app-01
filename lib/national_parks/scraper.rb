class NationalParks::Scraper
  attr_accessor :page

  def park_scraper
    page = Nokogiri::HTML(open("https://www.national-park.com/category/parks/"))
    parks_title = page.css(".post-title")
  end #park_scraper

  def parks_from_scraper
    park_titles = []
    park_scraper.each do|park_title|
      park_titles << NationalParks::Park.new(park_title.text.strip)
    end
    park_titles.drop(1)
  end

  def make_new_parks
    all_parks = []
    parks_from_scraper.each do |a|
      all_parks << NationalParks::Park.new(a)
    end #each
    all_parks
    binding.pry
  end #make_new_parks

end
