# frozen_string_literal: true

# begin
#   WebScraper module that will be used to store all the classes and methods used for this project
# end
module WebScraper
  # Menu class to implement different options from the menu
  class Menu
    # begin
    # checks to see if the user input is an available option from the menu and if it is it does this option. Returns
    # false if user wished to search a new keyword or quit and true otherwise
    #
    # @param input
    #           user input from console
    # @param jobs
    #           array of type job from the current query
    # @param view
    #           view object for printing to screen
    # @ensures correct option from menu is executed and function returns correct value
    # @returns false if input equals '8' or 'quit' and true otherwise
    # @modifies jobs
    # end
    def in_menu?(input, jobs, view)
      in_menu = true
      case input
      when WebScraper::MENU_OPTION_ONE
        sort_and_print_jobs_min_salary(jobs, view)
      when WebScraper::MENU_OPTION_TWO
        sort_and_print_jobs_max_salary(jobs, view)
      when WebScraper::MENU_OPTION_THREE
        sort_and_print_jobs_deadline(jobs, view)
      when WebScraper::MENU_OPTION_FOUR
        sort_and_print_jobs_start_date(jobs, view)
      when WebScraper::MENU_OPTION_FIVE
        sort_and_print_jobs_end_date(jobs, view)
      when WebScraper::MENU_OPTION_SIX
        sort_and_print_jobs_pos_avail(jobs, view)
      when WebScraper::MENU_OPTION_SEVEN
        sort_and_print_jobs_full_part(jobs, view)
      when WebScraper::MENU_OPTION_EIGHT
        sort_and_print_jobs_temp_reg(jobs, view)
      when WebScraper::MENU_OPTION_NINE
        compare_two(jobs, view)
      when WebScraper::MENU_OPTION_TEN
        in_menu = false
      when WebScraper::QUIT
        in_menu = false
      else
        if job_title?(input, jobs, view) # if the user types in a valid job title, display details
        else
          view.error
        end
      end
      in_menu
    end

    # begin
    # prints all jobs with their associated min salary to screen sorted by highest min salary
    #
    # @param jobs
    #           array of type job from the current query
    # @param view
    #           view object for printing to screen
    # @ensures all jobs are printed to screen with their associated min salary and are sorted by the highest min salary
    # @modifies jobs
    # end
    def sort_and_print_jobs_min_salary(jobs, view)
      jobs.sort! { |one, two| two.min_sal.to_i <=> one.min_sal.to_i }
      jobs.each { |job| view.jobs_and_min_salary(job) }
    end

    # begin
    # prints all jobs with their associated max salary to screen sorted by highest max salary
    #
    # @param jobs
    #           array of type job from the current query
    # @param view
    #           view object for printing to screen
    # @ensures all jobs are printed to screen with their associated max salary and are sorted by the highest
    #           max salary
    # @modifies jobs
    # end
    def sort_and_print_jobs_max_salary(jobs, view)
      jobs.sort! { |one, two| two.max_sal.to_i <=> one.max_sal.to_i }
      jobs.each { |job| view.jobs_and_max_salary(job) }
    end

    # begin
    # prints all jobs with their associated application deadline date to screen sorted by application deadline date
    #
    # @param jobs
    #           array of type job from the current query
    # @param view
    #           view object for printing to screen
    # @ensures all jobs are printed to screen with their associated application deadline date and are
    # sorted by application deadline date
    # @modifies jobs
    # end
    def sort_and_print_jobs_deadline(jobs, view)
      jobs.sort! { |one, two| year_first(one.app_deadline) <=> year_first(two.app_deadline) }
      jobs.each { |job| view.jobs_and_app_deadline(job) }
    end

    # from the start_date
    #
    # begin
    # prints all jobs with their associated start date to screen sorted by their start date
    #
    # @param jobs
    #           array of type job from the current query
    # @param view
    #           view object for printing to screen
    # @ensures all jobs are printed to screen with their associated start date and are
    # sorted by their start date
    # @modifies jobs
    # end
    def sort_and_print_jobs_start_date(jobs, view)
      jobs.sort! { |one, two| year_first(one.start_date) <=> year_first(two.start_date) }
      jobs.each { |job| view.jobs_and_start_date(job) }
    end

    # from the end_date
    # begin
    # prints all jobs with their associated end date to screen sorted by their end date
    #
    # @param jobs
    #           array of type job from the current query
    # @param view
    #           view object for printing to screen
    # @ensures all jobs are printed to screen with their associated end date and are
    # sorted by their end dates
    # @modifies jobs
    # end
    def sort_and_print_jobs_end_date(jobs, view)
      jobs.sort! { |one, two| year_first(one.end_date) <=> year_first(two.end_date) }
      jobs.each { |job| view.jobs_and_end_date(job) }
    end

    # begin
    # prints all jobs with their positions available to the screen sorted by their positions available
    #
    # @param jobs
    #           array of type job from the current query
    # @param view
    #           view object for printing to screen
    # @ensures all jobs are printed to screen with their positions available and are
    # sorted by their positions available
    # @modifies jobs
    # end
    def sort_and_print_jobs_pos_avail(jobs, view)
      jobs.sort! { |one, two| two.pos_available <=> one.pos_available }
      jobs.each { |job| view.jobs_and_pos_avail(job) }
    end

    # begin
    # prints all jobs with their positions available to the screen sorted by full / part time information
    #
    # @param jobs
    #           array of type job from the current query
    # @param view
    #           view object for printing to screen
    # @ensures all jobs are printed to screen with their full / part time information and are
    # sorted by their full / part time information
    # @modifies jobs
    # end
    def sort_and_print_jobs_full_part(jobs, view)
      jobs.sort! { |one, two| one.full_part <=> two.full_part }
      jobs.each { |job| view.jobs_and_full_part(job) }
    end

    # begin
    # prints all jobs with their temporary or regular information to the screen sorted
    # by temporary or regular information
    #
    # @param jobs
    #           array of type job from the current query
    # @param view
    #           view object for printing to screen
    # @ensures all jobs are printed to screen with their temporary or regular information and are
    # sorted by their temporary or regular information
    # @modifies jobs
    # end
    def sort_and_print_jobs_temp_reg(jobs, view)
      jobs.sort! { |one, two| one.temp_reg <=> two.temp_reg }
      jobs.each { |job| view.jobs_and_temp_reg(job) }
    end

    # begin
    # prints all jobs with their details that have the same job title as input and returns true if any jobs were
    # printed
    #
    # @param input
    #    user input from console
    # @param jobs
    #     array of type job from the current query
    # @param view
    #     view object for printing to screen
    # @return
    #     if theres a job with the same title as input in jobs returns true otherwise returns false
    # @ensures
    #     all jobs with the same job title as input are printed to the screen with details and the correct
    #     boolean value is returned
    # end
    def job_title?(input, jobs, view)
      job_title = false
      jobs.each do |job|
      if job.title.to_s.upcase == input.upcase # account for case insensitivity
          view.print_details(job)
          job_title = true
      end
      end
      job_title
    end

    # begin
    # loops through all available jobs to find a specific job entered by the user
    #
    # @param input
    #    user input from console
    # @param jobs
    #     array of type job from the current query
    # @return
    #     if theres a job with the same title as input in jobs returns the job object
    # @requires
    #     input is in jobs and jobs is not empty
    # @ensures
    #     the job entered by the user is found and returned as an object
    # end
    def input_to_job_object(input, jobs)
      job_object = jobs[0]
      jobs.each do |job|
        job_object = job if job.title.to_s.upcase == input.upcase
      end
      job_object
    end

    # begin
    # loops through all available jobs to determine if 'input' is a job in 'jobs'
    #
    # @param input
    #    user input from console
    # @param jobs
    #     array of type job from the current query
    # @return
    #     if theres a job with the same title as input in jobs returns true otherwise returns false
    # @ensures
    #     returns true if input entered by user is in jobs and false otherwise
    # end
    def input_in_jobs?(input, jobs)
      found = false
      jobs.each do |job|
        found = true if job.title.to_s.upcase == input.upcase
      end
      found
    end

    # begin
    # turns string that is in MM/DD/YYYY format to YYYYMMDD so it is easier to sort
    #
    # @param old_date
    #       a string whose date you want to create the new format from
    # @return
    #     a string in the form YYYYMMDD
    # @requires
    #     old_date to be a string that is in the form MM/DD/YYYY where MM are 2 digits representing the month
    #     DD are 2 digits representing the date and YYYY are 4 digits representing the year
    # @ensures
    #     returns a string that is in the from YYYYMMDD based off the old_date
    # end
    def year_first(old_date)
      date_split = old_date.split '/'
      date_split[WebScraper::YEAR_INDEX] + date_split[WebScraper::MONTH_INDEX] + date_split[WebScraper::DAY_INDEX]
    end

    # begin
    # gets the names of the jobs from the user to be compared and prints the comparison
    # printed
    #
    # @param jobs
    #     array of type job from the current query
    # @param view
    #     view object for printing to screen
    # @ensures
    #     the comparison of the two jobs is displayed on screen
    # @return
    #     some string
    # end
    def compare_two(jobs, view)
      first_input = get_valid_job(jobs, view, WebScraper::FIRST_INPUT)
      second_input = get_valid_job(jobs, view, WebScraper::SECOND_INPUT)
      job_one = input_to_job_object(first_input, jobs) # job_one is now a job object
      job_two = input_to_job_object(second_input, jobs) # job_two is now a job object
      view.comparing(job_one, job_two)
    end

    # begin
    # gets a valid input that is in jobs from the user
    #
    # @param jobs
    #     array of type job from the current query
    # @param view
    #     view object for printing to screen
    # @param first_input
    #     boolean to represent if user wants to print prompt for first input or second input
    # @ensures
    #   a valid input that is in jobs is gotten form the user and the user is prompted for the
    #   correct input
    #
    # @return
    #     if a valid job that has been inputted by the user
    # end
    def get_valid_job(jobs, view, first_input)
      valid_input = false
      input = ''
      until valid_input
        view.comparator_prompt_first_job if first_input
        view.comparator_prompt_second_job unless first_input
        input = gets.chomp
        valid_input = input_in_jobs?(input, jobs)
        view.error unless valid_input
      end
      input
    end
  end
end
