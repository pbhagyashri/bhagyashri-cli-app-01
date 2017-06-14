class NationalParks::Scraper
  attr_accessor :page

  def park_scraper
    parks_title = page.css(".post-title")
  end #park_scrape

  def parks_from_scraper
    park_titles = []
    park_scraper.each do|park_title|
      park_titles << NationalParks::Park.new(park_title.text.strip)
    end
    park_titles.drop(1)
  end

  def self.park_titles
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

  def page
    @page = Nokogiri::HTML(open("https://www.national-park.com/category/parks/"))
  end

  def detail_page(title)

     @detail_page = NationalParks::Details.new(title)
     all_paras = @detail_page.doc.css(".entry-inner p")

     all_paras.any? do |p|
       if p.text.include?("National park was established")
         puts "#{p.text}"
         puts "                              "
       end
     end

     all_paras.any? do |p|
       if p.text.include?("camping" || "Backcountry")
         puts "#{p.text}"
         puts "                              "
       end
     end

     all_paras.any? do |p|
       if p.text.include?("Bicycle")
         puts "#{p.text}"
         puts "                              "
       end
     end

     all_paras.any? do |p|
       if p.text.include?("viewing wildlife")
         puts "#{p.text}"
         puts "                              "
       end
     end

     all_paras.any? do |p|
       if p.text.include?("fishing")
         puts "#{p.text}"
         puts "                              "
       end
     end

     all_paras.any? do |p|
       if p.text.include?("hiking trails")
         puts "#{p.text}"
         puts "                              "
       end
     end

     all_paras.any? do |p|
       if p.text.include?("lodging")
         puts "#{p.text}"
         puts "                              "
       end
     end

  end #detail_page

end
