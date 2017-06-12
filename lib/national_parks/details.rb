class NationalParks::CLI:Details
  attr_accessor :doc
  def initialize(park_name)
    @park_name = park_name
    @doc = Nokogiri::HTML(open("https://www.national-park.com/welcome-to-#{park_name}-national-park/"))
  end

end
