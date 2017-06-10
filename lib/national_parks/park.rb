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

  def self.new_from_index_page(r)
    self.new(
       r.css(".post-title").text
       #r.css(".entry p").text
      )
  end

end
