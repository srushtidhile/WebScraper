# Web Scraping

**WebScraper** is a tool which searches the jobsatosu site for all job postings with the user's keyword input. If there are no results, the tool will just print a message saying so. There are also several features this web scraper tool allows for including accessing the details for one particular job, sorting the jobs from highest to lowest salary, lowest to highest salary, upcoming application deadline, posting start date and end date, positions available, etc.

# How to Use the WebScraper
Once prompted for a keyword, user should enter a keyword related to the jobs they would like to see. Underneath the job postings, the user will see a menu of options to help them explore specific jobs, compare jobs to one another, and sort the jobs listed.

# Installing the WebScraper
Enter this code at the terminal:

    $ git clone https://github.com/cse3901-2020au-1240/proj3-dabuggers.git

# Running the WebScraper
Enter this code at the terminal:

    $ cd proj3-dabuggers
    $ bundle
    $ ruby main.rb

# Code Design
The code is written entirely in Ruby. There are six files: main.rb, view.rb, jobs_parser.rb, job.rb, README.md, Gemfile
**main.rb** calls the events of the procedure starting from the prompt for a keyword to the end of the last menu option the user chooses to select
**view.rb** contains all the relative print statements such as the user prompt for a keyword, message that reports when there are 0 results, and all the names of the available jobs posted.
**job.rb** contains the definition to all the attributes related to a specific job, minimum and maximum salary, and conversion from hourly to annual salary if required.
**menu.rb** contains methods that check the menu options and sort and print accordingly.
**jobs_parser.rb** contains all of the parser methods to fill the jobs array with job object which each have several attributes.
**constants.rb** contains all the variables used in place of constants throughout the program.

# How to Use
When prompted, the user should enter a keyword for related job postings and then press 'enter.'
The number of search results should display along with the list of jobs related to the keyword.
Additionally, a menu of options to choose from will be displayed. The user can type in the name of a specific job they would like to see more details about or type in a number corresponding to which option they would like to proceed with.
The user can also type 'quit' to exit the program.

# Testing
The code for this project is difficult to test because we do not know exactly what to expect from the website queries, as they can change. Nevertheless, there is an RSpec testing suite to run tests that ensure when querying for all jobs that some jobs are returned, and all fields are populated for each job.
To run the testing suite, enter the following commands:

    $ bundle exec rspec spec/jobs_parser_spec.rb

For the rest of the testing, we simply queried the website manually, and compared with the webscraper results.

# Style Guide
Rubocop v0.8.4 is used to style the code
There are a few methods that violate Rubocop rules because they are more than 10 lines, but it does not make sense to split them into multiple functions, so we left them. This is also the case with the view class and the RSpec test cases.
