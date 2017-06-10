class NationalParks::Park
  attr_accessor :name, :location, :highlight, :url, :doc

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def doc
    @doc = Nokogiri::HTML(open("https://www.national-park.com/category/parks/"))
  end

  def highlight
    @highlight = doc.css(".entry p").last.text.strip
  end
end
