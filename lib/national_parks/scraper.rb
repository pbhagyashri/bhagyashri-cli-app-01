class NationalParks::Scraper
  attr_accessor :page

  def park_scraper
    parks_title = page.css(".post-title")
  end #park_scraper

  def highlight_scraper
    park_highlight = page.css(".entry p")
  end

  def parks_from_scraper
    park_titles = []
    park_scraper.each do|park_title|
      park_titles << NationalParks::Park.new(park_title.text.strip)
    end
    park_titles.drop(1)

  end

  def park_titles
    parks_from_scraper.collect do |park|
      first_half = park.name.gsub("Welcome to", "")
      name = first_half.gsub("National Park", "").strip.downcase
      name.include?(" ") ? name.gsub(" ", "-") : name
    end
  end

  def make_new_parks
    all_parks = []
    parks_from_scraper.each do |a|
      all_parks << NationalParks::Park.new(a)
    end #each
    all_parks
  end #make_new_parks

  def assign_highlights
    i = 0
    while i < 10
      make_new_parks.collect do |park|
        park.highlight = highlight_scraper[i += 1].text
        binding.pry
      end
    end
  end

  def page
    @page = Nokogiri::HTML(open("https://www.national-park.com/category/parks/"))
  end

  def detail_page
   park_titles.collect do |park|
     @detail_page = NationalParks::Details.new(park)
     @detail_page.doc.css("h2 + p").text
     binding.pry
  end
  end

end
