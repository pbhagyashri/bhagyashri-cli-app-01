class NationalParks::Park
  attr_accessor :name, :doc

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end
end
