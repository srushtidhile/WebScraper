# frozen_string_literal: true

# begin
#   WebScraper module that will be used to store all the classes and methods used for this project
# end
module WebScraper
  # Constants used throughout the program
  BASE_URL = 'https://www.jobsatosu.com' # base url for get requests
  JOB_POSTING_SELECTOR = '#search_results > div' # CSS selector for job postings
  JOB_INFO_SELECTOR = '.col-md-push-0' # CSS selector for job info
  JOB_ACTIONS_SELECTOR = "a[href^='/postings']" # CSS selector for job details button
  JOB_DETAILS_SELECTOR = 'td' # CSS selector for the details of a job
  JOB_TITLE_POS = 0 # position in basic job properties array of the job title
  JOB_DEPT_POS = 1 # position in basic job properties array of the department
  JOB_DEADLINE_POS = 2 # position in basic job properties array of the application deadline
  JOB_SALARY_POS = 4 # position in basic job properties array of the salary range
  JOB_POS_AVAIL_POS = 2 # position in detailed job properties array of positions available
  JOB_DUTIES_SUM_POS = 8 # position in detailed job properties array of duties summary
  JOB_REQ_QUAL_POS = 11 # position in detailed job properties array of required qualifications
  JOB_DES_QUAL_POS = 12 # position in detailed job properties array of desired qualifications
  JOB_CAT_POS = 14 # position in detailed job properties array of category
  JOB_FTE_POS = 15 # position in detailed job properties array of fte
  JOB_FULL_PART_POS = 16 # position in detailed job properties array of full or part time
  JOB_TEMP_REG_POS = 17 # position in detailed job properties array of temporary or regular
  JOB_START_DATE_POS = 18 # position in detailed job properties array of posting start date
  JOB_END_DATE_POS = 19 # position in detailed job properties array of posting end date
  JOB_CONTACT_NAME_POS = 20 # position in detailed job properties array of contact name
  JOB_CONTACT_PHONE_POS = 21 # position in detailed job properties array of contanct phone #
  SAL_RANGE_LENGTH_ONE_NUM = 2 # the salary range array length if 1 number is given for range
  SAL_RANGE_LENGTH_TWO_NUM = 4 # the salary range array length if 1 number is given for range
  SAL_RANGE_MIN_POS = 0 # the position of min in salary range array
  SAL_RANGE_MAX_POS = 2 # the position of max in salary range array
  MONEY_FORMATTING = '$,' # used to get of string elements that prevent conversion to int
  NOT_APPLICABLE = 'Negotiable' # used for if a property isn't applicable for a certain job
  HOURS_A_WEEK = 40 # used to convert to annual salary
  WEEKS_A_YEAR = 52 # used to convert to annual salary
  SAL_TYPE_HOURLY = 'hourly' # used to compare salary types
  MENU_OPTION_ONE = '1' # used to check if user input equals first menu option
  MENU_OPTION_TWO = '2' # used to check if user input equals second menu option
  MENU_OPTION_THREE = '3' # used to check if user input equals third menu option
  MENU_OPTION_FOUR = '4' # used to check if user input equals fourth menu option
  MENU_OPTION_FIVE = '5' # used to check if user input equals fifth menu option
  MENU_OPTION_SIX = '6' # used to check if user input equals sixth menu option
  MENU_OPTION_SEVEN = '7' # used to check if user input equals seventh menu option
  MENU_OPTION_EIGHT = '8' # used to check if user input equals eighth menu option
  MENU_OPTION_NINE = '9' # used to check if user input equals ninth menu option
  MENU_OPTION_TEN = '10' # used to check if user input equals tenth menu option
  FIRST = 0 # used for getting first element of arrays
  LINK_ATT = 'href' # attribute used to get link from html element
  QUIT = 'quit' # user input used to quit the application
  COMMAS_REG_EXP = /(\d)(?=(\d{3})+(?!\d))/.freeze # regular expression for adding commas in numbers
  MONEY_UNITS = '$' # units for money
  FIRST_INPUT = true # used to help print prompt for 1st user input for comparing jobs
  SECOND_INPUT = false # used to help print prompt for 2nd user input for comparing jobs
  MONTH_INDEX = 0 # position in which month is located with respect to year and day for job attributes that store a date
  DAY_INDEX = 1 # position in which day is located with respect to month and year for job attributes that store a date
  YEAR_INDEX = 2 # position in which year is located with respect to month and day for job attributes that store a date
  RESULTS_PER_PAGE = 30
  STARTING_PAGE_NUMBER = 1
end
