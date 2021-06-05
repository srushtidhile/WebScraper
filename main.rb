# frozen_string_literal: true

# Files needed to run the webscraper
require_relative 'jobs_parser'
require_relative 'view'
require_relative 'constants'
require_relative 'menu'

# Instantiate objects
view = WebScraper::View.new
parser = WebScraper::JobsParser.new
menu = WebScraper::Menu.new
query = ''

while query != WebScraper::QUIT

  # Prompt the user for a keyword
  view.keyword_prompt
  query = gets.chomp

  # Query jobsatosu.com
  parser.search query

  # Print available job titles and bring to menu if any are available or do nothing if query = 'quit'
  if query == WebScraper::QUIT
    # do nothing so can exit
  elsif parser.jobs.empty?
    view.no_results
  else
    view.newline
    view.number_of_results(parser.jobs) # tell user how many results were found
    view.header_all_results
    parser.jobs.each { |job| view.all_results(job) } # print each job in the loaded results
    in_menu = true
    while in_menu # continue printing out the menu options unless otherwise instructed
      view.display_menu
      query = gets.chomp # get next input
      in_menu = menu.in_menu?(query, parser.jobs, view)
    end
    parser.jobs.clear
  end

end
