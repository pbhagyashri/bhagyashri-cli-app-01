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

  def details
    detail = NationalParks::Scraper.new.detail_page("yellowstone")
    puts "#{detail}"
  end

  def start
    input = nil
    puts "Enter the number of the National Park you would like to learn more about!"

    while input != "exit"
      input = gets.strip.downcase

      case input
        when "1"
          details
          puts "Please enter list or exit"
        when "list"
          list_parks
        when "exit"
          greeting
        else
          puts "Invalid input. Please enter list or exit"
      end #case
    end #while
  end #start

  def greeting
    puts "Thank you for using my app. Have a nice trip!!"
  end #greeting

end #NationalParks::CLI
