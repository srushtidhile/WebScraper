# frozen_string_literal: true

require 'mechanize'
require 'nokogiri'
require_relative 'job'
require_relative 'constants'

# begin
#   WebScraper module that will be used to store all the classes and methods used for this project
# end
module WebScraper
  # Parser class to parse HTML documents
  class JobsParser
    # Creates accesor methods for main page of HTTP get request
    attr_reader :main_page, :jobs

    # Creates a mechanize object
    def initialize
      @agent = Mechanize.new
    end

    # begin
    #   Searches jobsatosu.com for jobs with the given keyword, stores the HTML in main_page,
    #   and uses the job object to store the jobs from the search results in the jobs array
    #
    #   @param query
    #             keyword to search jobs site with
    #   @ensures main_page = the HTML document returned from the query and jobs = array jobs matching keyword search
    #   @modifies main_page
    #   @modifies jobs
    # end
    def search(query)
      @main_page = @agent.get "#{WebScraper::BASE_URL}/postings/search?query=#{query}&commit=Search"
      results = @main_page.css WebScraper::JOB_POSTING_SELECTOR
      @jobs = []
      results.each { |result| @jobs.push(fill_job_fields(result)) }
      check_more_pages = jobs.length
      pages = WebScraper::STARTING_PAGE_NUMBER
      # look at other pages for 30+ results
      while check_more_pages == WebScraper::RESULTS_PER_PAGE
        pages += STARTING_PAGE_NUMBER
        check_more_pages -= WebScraper::RESULTS_PER_PAGE
        @next_page = @agent.get "#{WebScraper::BASE_URL}/postings/search?query=#{query}&commit=Search&page=#{pages}"
        results = @next_page.css WebScraper::JOB_POSTING_SELECTOR
        results.each { |result| @jobs.push(fill_job_fields(result)) }
        check_more_pages += results.length
      end
    end

    # begin
    #   Fills the all of the fields of a job object using CSS selectors from the given parameter
    #
    #   @param page
    #             the html element containing the information for a job
    #   @requires page is a valid html element containing all the necessary info for a job
    #   @ensures fill_job_fields = a job object with filled out fields
    #   @returns a job object with filled out fields
    # end
    def fill_job_fields(page)
      job = WebScraper::Job.new
      get_basic_fields(page, job)
      url_ext = page.css(WebScraper::JOB_ACTIONS_SELECTOR)[WebScraper::FIRST][WebScraper::LINK_ATT]
      detail_page = @agent.get "#{WebScraper::BASE_URL}#{url_ext}"
      get_detailed_fields(detail_page, job)
      job
    end

    # begin
    #   Gets the basic fields of a job object using CSS selectors from the given parameter
    #
    #   @param page
    #             the html element containing the information for a job
    #   @param job
    #             the job whose fields will be filled in
    #   @requires page is a valid html element containing all the basic info for a job
    #   @ensures job parameter has basic fields filled in
    #   @modifies job
    # end
    def get_basic_fields(page, job)
      job.title = get_title(page)
      job.department = get_department(page)
      job.app_deadline = get_app_deadline(page)
      job.salary_range = get_salary_range(page)
    end

    # begin
    #   Gets the detailed fields of a job object using CSS selectors from the given parameter
    #
    #   @param detail_page
    #             the html element containing the information for a job
    #   @param job
    #             the job whose fields will be filled in
    #   @requires page is a valid html element containing all the detailed info for a job
    #   @ensures job parameter has detailed fields filled in
    #   @modifies job
    # end
    def get_detailed_fields(detail_page, job)
      job.pos_available = get_pos_available(detail_page)
      job.duties_summary = get_duties_summary(detail_page)
      job.req_qualifications = get_req_qualifications(detail_page)
      job.des_qualifications = get_des_qualifications(detail_page)
      job.category = get_category(detail_page)
      job.fte = get_fte(detail_page)
      get_remaining_fields(detail_page, job)
    end

    # begin
    #   Gets the remaining detailed fields of a job object using CSS selectors from the given parameter.
    #   This method is only here to shorten the length of the get_detailed_fields method to avoid rubocop errors.
    #
    #   @param detail_page
    #             the html element containing the information for a job
    #   @param job
    #             the job whose fields will be filled in
    #   @requires page is a valid html element containing all the detailed info for a job
    #   @ensures job parameter has remaining fields filled in
    #   @modifies job
    # end
    def get_remaining_fields(detail_page, job)
      job.full_part = get_full_part(detail_page)
      job.temp_reg = get_temp_reg(detail_page)
      job.start_date = get_start_date(detail_page)
      job.end_date = get_end_date(detail_page)
      job.contact_name = get_contact_name(detail_page)
      job.contact_phone = get_contact_phone(detail_page)
    end

    # begin
    #   Gets the job title using CSS selectors for the given page
    #
    #   @param page
    #             the html element containing the information for a job
    #   @requires page is a valid html element containing all the necessary info for a job
    #   @ensures get_title = the title of the job from the given page
    #   @returns the title of the job from the given page
    # end
    def get_title(page)
      page.css(WebScraper::JOB_INFO_SELECTOR)[WebScraper::JOB_TITLE_POS].content.strip
    end

    # begin
    #   Gets the job departemnt using CSS selectors for the given page
    #
    #   @param page
    #             the html element containing the information for a job
    #   @requires page is a valid html element containing all the necessary info for a job
    #   @ensures get_department = the department of the job from the given page
    #   @returns the department of the job from the given page
    # end
    def get_department(page)
      page.css(WebScraper::JOB_INFO_SELECTOR)[WebScraper::JOB_DEPT_POS].content.strip
    end

    # begin
    #   Gets the job application deadline using CSS selectors for the given page
    #
    #   @param page
    #             the html element containing the information for a job
    #   @requires page is a valid html element containing all the necessary info for a job
    #   @ensures get_app_deadline = the application deadline of the job from the given page
    #   @returns the application deadline of the job from the given page
    # end
    def get_app_deadline(page)
      page.css(WebScraper::JOB_INFO_SELECTOR)[WebScraper::JOB_DEADLINE_POS].content.strip
    end

    # begin
    #   Gets the salary range using CSS selectors for the given page
    #
    #   @param page
    #             the html element containing the information for a job
    #   @requires page is a valid html element containing all the necessary info for a job
    #   @ensures get_salary_range = the salary range of the job from the given page
    #   @returns the salary range of the job from the given page
    # end
    def get_salary_range(page)
      page.css(WebScraper::JOB_INFO_SELECTOR)[WebScraper::JOB_SALARY_POS].content.strip
    end

    # begin
    #   Gets the # of positions available using CSS selectors for the given page
    #
    #   @param page
    #             the html element containing the information for a job
    #   @requires page is a valid html element containing all the necessary info for a job
    #   @ensures get_pos_available = the # of posiitons available for the job from the given page
    #   @returns the # of posiitons available for the job from the given page
    # end
    def get_pos_available(page)
      page.css(WebScraper::JOB_DETAILS_SELECTOR)[WebScraper::JOB_POS_AVAIL_POS].content.strip.to_i
    end

    # begin
    #   Gets the summary of duties using CSS selectors for the given page
    #
    #   @param page
    #             the html element containing the information for a job
    #   @requires page is a valid html element containing all the necessary info for a job
    #   @ensures get_duties_summary = the summary of duties for the job from the given page
    #   @returns the summary of duties for the job from the given page
    # end
    def get_duties_summary(page)
      page.css(WebScraper::JOB_DETAILS_SELECTOR)[WebScraper::JOB_DUTIES_SUM_POS].content.strip
    end

    # begin
    #   Gets the required qualifications using CSS selectors for the given page
    #
    #   @param page
    #             the html element containing the information for a job
    #   @requires page is a valid html element containing all the necessary info for a job
    #   @ensures get_req_qualifications = the required qualifications for the job from the given page
    #   @returns the required qualifications for the job from the given page
    # end
    def get_req_qualifications(page)
      page.css(WebScraper::JOB_DETAILS_SELECTOR)[WebScraper::JOB_REQ_QUAL_POS].content.strip
    end

    # begin
    #   Gets the desired qualifications using CSS selectors for the given page
    #
    #   @param page
    #             the html element containing the information for a job
    #   @requires page is a valid html element containing all the necessary info for a job
    #   @ensures get_des_qualifications = the desired qualifications for the job from the given page
    #   @returns the desired qualifications for the job from the given page
    # end
    def get_des_qualifications(page)
      page.css(WebScraper::JOB_DETAILS_SELECTOR)[WebScraper::JOB_DES_QUAL_POS].content.strip
    end

    # begin
    #   Gets the category using CSS selectors for the given page
    #
    #   @param page
    #             the html element containing the information for a job
    #   @requires page is a valid html element containing all the necessary info for a job
    #   @ensures get_category = the category for the job from the given page
    #   @returns the category for the job from the given page
    # end
    def get_category(page)
      page.css(WebScraper::JOB_DETAILS_SELECTOR)[WebScraper::JOB_CAT_POS].content.strip
    end

    # begin
    #   Gets the fte using CSS selectors for the given page
    #
    #   @param page
    #             the html element containing the information for a job
    #   @requires page is a valid html element containing all the necessary info for a job
    #   @ensures get_fte = the fte for the job from the given page
    #   @returns the fte for the job from the given page
    # end
    def get_fte(page)
      page.css(WebScraper::JOB_DETAILS_SELECTOR)[WebScraper::JOB_FTE_POS].content.strip.to_i
    end

    # begin
    #   Returns whether the job is full or part time using CSS selectors for the given page
    #
    #   @param page
    #             the html element containing the information for a job
    #   @requires page is a valid html element containing all the necessary info for a job
    #   @ensures get_full_apart = full or part depending on if the job is full or part time
    #   @returns whether the job from the given page is full or part time
    # end
    def get_full_part(page)
      page.css(WebScraper::JOB_DETAILS_SELECTOR)[WebScraper::JOB_FULL_PART_POS].content.strip
    end

    # begin
    #   Returns whether the job is temporary or regular using CSS selectors for the given page
    #
    #   @param page
    #             the html element containing the information for a job
    #   @requires page is a valid html element containing all the necessary info for a job
    #   @ensures get_temp_reg = temporary or regular depending on if the job is temp or reg
    #   @returns whether the job from the given page is temporary or regular
    # end
    def get_temp_reg(page)
      page.css(WebScraper::JOB_DETAILS_SELECTOR)[WebScraper::JOB_TEMP_REG_POS].content.strip
    end

    # begin
    #   Gets the posting start date using CSS selectors for the given page
    #
    #   @param page
    #             the html element containing the information for a job
    #   @requires page is a valid html element containing all the necessary info for a job
    #   @ensures get_start_date = the posting start date for the job from the given page
    #   @returns the posting start date for the job from the given page
    # end
    def get_start_date(page)
      page.css(WebScraper::JOB_DETAILS_SELECTOR)[WebScraper::JOB_START_DATE_POS].content.strip
    end

    # begin
    #   Gets the posting end date using CSS selectors for the given page
    #
    #   @param page
    #             the html element containing the information for a job
    #   @requires page is a valid html element containing all the necessary info for a job
    #   @ensures get_end_date = the posting end date for the job from the given page
    #   @returns the posting end date for the job from the given page
    # end
    def get_end_date(page)
      page.css(WebScraper::JOB_DETAILS_SELECTOR)[WebScraper::JOB_END_DATE_POS].content.strip
    end

    # begin
    #   Gets the contact name using CSS selectors for the given page
    #
    #   @param page
    #             the html element containing the information for a job
    #   @requires page is a valid html element containing all the necessary info for a job
    #   @ensures get_contact_name = the contact name for the job from the given page
    #   @returns the contact name for the job from the given page
    # end
    def get_contact_name(page)
      page.css(WebScraper::JOB_DETAILS_SELECTOR)[WebScraper::JOB_CONTACT_NAME_POS].content.strip
    end

    # begin
    #   Gets the contact phone using CSS selectors for the given page
    #
    #   @param page
    #             the html element containing the information for a job
    #   @requires page is a valid html element containing all the necessary info for a job
    #   @ensures get_contact_phone = the contact phone for the job from the given page
    #   @returns the contact phone for the job from the given page
    # end
    def get_contact_phone(page)
      page.css(WebScraper::JOB_DETAILS_SELECTOR)[WebScraper::JOB_CONTACT_PHONE_POS].content.strip
    end
  end
end
