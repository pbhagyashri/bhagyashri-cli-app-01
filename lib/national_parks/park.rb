class NationalParks::Park
  attr_accessor :name, :location, :highlight, :url

   def initialize(name, highlight)
     @name = name
     @highlight = highlight
   end

end
