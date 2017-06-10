class NationalParks::Scraper
  attr_accessor :page

  def park_scraper
    page = Nokogiri::HTML(open("https://www.national-park.com/category/parks/"))
    parks_title = page.css(".post-title")
  end

  # def make_new_parks
  #   park_scraper.each do |a|
  #     new = NationalParks::Park.new_from_index_page(a)
  #     binding.pry
  #   end
  # end

  def make_new_parks

  end

  def self.details
    doc = Nokogiri::HTML(open("https://www.national-park.com/welcome-to-yosemite-national-park/"))
    titles = doc.css("strong")
  end

end

#parks_url = page.css(".post-title a").attr("href").value
