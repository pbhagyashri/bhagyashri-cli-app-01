class NationalParks::Park
  attr_accessor :name, :location, :highlight, :url, :doc

  @@all = []

  def initialize(name, highlight)
    @name = name
    @highlight = highlight

    @@all << self
  end

  def self.all
    @@all
  end

  def self.new_from_index_page(r)
    self.new(
      r.css(".post-title:n").text,
      r.css(".entry p").text
      )
  end

  def doc
    @doc = Nokogiri::HTML(open("https://www.national-park.com/category/parks/"))
  end

  def highlight
    @highlight = doc.css(".entry p").text.strip
  end

  def name
    @name = doc.css(".post-title").text.strip
  end
end
