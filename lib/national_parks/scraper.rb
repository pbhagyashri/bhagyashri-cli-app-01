class NationalParks::Scraper
  attr_accessor :page

  def park_scraper
    parks_title = page.css(".post-title")
  end #park_scraper

  def highlight_scraper
    park_highlight = page.css(".entry p")
    park_highlight.collect{|highlight| highlight.text}
  end

  def parks_from_scraper
    park_titles = []
    park_scraper.each do|park_title|
      park_titles << NationalParks::Park.new(park_title.text.strip)
    end
    park_titles.drop(1)

  end

  def assign_highlights
    all_parks = []
    i = 0
    while i < 10
      parks_from_scraper.each do |park|
       park.highlight = highlight_scraper[i += 1]
       all_parks << park
       i+= 1
      end
    end
    all_parks

  end

  def page
    @page = Nokogiri::HTML(open("https://www.national-park.com/category/parks/"))
  end

end
