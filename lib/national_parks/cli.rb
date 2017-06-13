class NationalParks::CLI
  def call
    list_parks
    start
  end #call

  def list_parks
    NationalParks::Scraper.new.parks_from_scraper.each_with_index do |park, i|

      puts "#{i+1}. #{park.name.gsub("Welcome to","")}."
    #  puts "#{i+1}. #{park.highlight}."

    end
  end

  def start
    input = nil
    puts "Enter the number of the National Park you would like to learn more about!"

    while input != "exit"
      input = gets.strip.downcase

      case input
        when "1"
          NationalParks::Park.all[0].name
          binding.pry
        when "list"
          list_park
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
