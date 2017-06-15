class NationalParks::Scraper
  attr_accessor :page

  def page
    @page = Nokogiri::HTML(open("https://www.national-park.com/category/parks/"))
  end

  def park_scraper
    parks_title = page.css(".post-title")
  end #park_scrape

  def parks_from_scraper
    park_titles = []
    park_scraper.each do|park_title|
      if !park_title.text.strip.include?("Historical")
        park_titles << NationalParks::Park.new(park_title.text.strip)
      end
    end
    park_titles.drop(1)
  end

  def visit_park(title)
    @visit_park = NationalParks::Details.new(title)
    @visit_park.doc.css("p a").attr("href").text
  end

  def detail_page(title)

     @detail_page = NationalParks::Details.new(title)
     all_paras = @detail_page.doc.css(".entry-inner p")

     all_paras.any? do |p|
       if p.text.include?("is located in")
         puts "Location"
         puts "#{p.text}"
         puts "                              "
       end
     end

     all_paras.any? do |p|
       if p.text.include?("national park located")
         puts "Location"
         puts "#{p.text}"
         puts "                              "
       end
     end

     all_paras.any? do |p|

       if p.text.include?("was established")
         puts "Establishment"
         puts "#{p.text}"
         puts "                              "
       end
     end

     all_paras.any? do |p|
       if p.text.include?("campsites")
         puts "Camping"
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
