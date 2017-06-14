# Specifications for the CLI Assessment

Specs:
- [x] Have a CLI for interfacing with the application
      cli.rb file has a start method that will run a cli that will ask for user input, and output date based on th input provided by user. It can handle invalid input as well as input in different forms like integer and sting.

- [x] Pull data from an external source
      scraper.rb and details.rb class can scrape https://www.national-park.com/category/parks/ and pull data.

- [x] Implement both list and detail views
      call method in cli.rb will first call list_parks method that will list the tiltes of every park.
      Next call method will call start method that will communicate with NationalParks::Details and NationalParks::Scraper class to scrape data from individual park's web-page. and output some details about the park user have requested.

    
