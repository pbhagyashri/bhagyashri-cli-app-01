class NationalParks::Park
  attr_accessor :name, :location, :highlight, :url, :doc

  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end
end
