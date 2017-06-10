class NationalParks::Park
  attr_accessor :name, :location, :highlight, :url, :doc

  @@all = []

  def initialize(name)
    @name = name
    #@highlight = highlight

    @@all << self
  end

  def self.all
    @@all
  end

  def self.new_from_index_page(r)
    self.new(
       r.css(".post-title").text
       #r.css(".entry p").text
      )
  end

  def doc
    @doc = Nokogiri::HTML(open("https://www.national-park.com/category/parks/"))
  end

  def highlight
    all_entries = doc.css(".entry p")
    new_entry = all_entries.pop
    # new_highlight = doc.css(".entry p")
    @highlight = new_entry

  end

end
