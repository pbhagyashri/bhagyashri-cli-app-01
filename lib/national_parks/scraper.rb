class NationalParks::Scraper
  attr_accessor :page

  def park_scraper
    page = Nokogiri::HTML(open("https://www.national-park.com/category/parks/"))
    parks_title = page.css(".post-title")

    all_park_titles = []
    parks_title.each do |park|
       all_park_titles << park.text.strip.
    end #each
    all_park_titles.drop(1)
  end #park_scraper

  def make_new_parks
    park_scraper.each do |a|
      new = NationalParks::Park.new_from_index_page(a)
    end #each
  end #make_new_parks
end
end
