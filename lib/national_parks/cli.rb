class NationalParks::CLI
  def call
    start
  end #call

  def start
    input = nil
    puts "Enter the number of the National Park you would like to learn more about!"
    while input != "exit"
      input = gets.strip.downcase

      case input
        when "1"
          puts "Welcome to the national park"
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
    puts "Thank you for using my gem. Have a nice trip!!"
  end #greeting

end #NationalParks::CLI
