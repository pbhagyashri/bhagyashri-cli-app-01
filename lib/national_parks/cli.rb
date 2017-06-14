class NationalParks::CLI
  def call
    list_parks
    start
  end #call

  def list_parks
    NationalParks::Scraper.new.parks_from_scraper.each_with_index do |park, i|
      puts "#{i+1}. #{park.name.gsub("Welcome to","")}."
    end
  end

  def park_name
    NationalParks::Scraper.new.parks_from_scraper.collect do |park|
      first_half = park.name.gsub("Welcome to", "")
      name = first_half.gsub("National Park", "").strip.downcase
      if name.include?(" ")
        name.gsub(" ", "-")
      else
        name
      end
    end
  end

  def start
    input = nil
    puts "Enter the number of the National Park you would like to learn more about!"

    while input != "exit"
      input = gets.strip.downcase
        name = park_name[input.to_i - 1]
       if input.to_i > 0
         details = NationalParks::Scraper.new.detail_page(name)
         puts details

         visit_park = NationalParks::Scraper.new.visit_park(name)

         puts "visit park here"
         puts "                              "
         puts visit_park
         puts "                              "
         puts "Please enter list to list all parks or exit"

       elsif input == "list"
         list_parks
         puts "Enter the number of the National Park you would like to learn more about! or exit"
       elsif input == "exit"
         greeting
       else
         puts "Invalid input. Please enter list or exit"
       end
    end #while
  end #start

  def greeting
    puts "Thank you for using my app. Have a nice trip!!"
  end #greeting

end #NationalParks::CLI
