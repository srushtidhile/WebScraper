# frozen_string_literal: true

# begin
#   WebScraper module that will be used to store all the classes and methods used for this project
# end
module WebScraper
  # View class with methods for printing to screen
  class View
    # prints prompt asking for a job keyword
    def keyword_prompt
      print "\nEnter a keyword to search for a job (Type 'quit' to exit the program): \n"
    end

    # begin
    # prints the menu with options for sorting, finding more information, comparing two jobs,
    # restarting search, and quitting
    # @ensures
    #       the menu is printed with options for sorting, finding more information, comparing two jobs,
    #       restarting search, and quitting
    # end
    def display_menu
      print "---------------------------------------------------------------------------------\n"
      print "\nChoose an option below by entering its corresponding number or type the name"
      print " of a job to get more details about it: \n"
      print "1. Sort the jobs by minimum salary\n"
      print "2. Sort the jobs by maximum salary\n"
      print "3. Sort the jobs by upcoming application deadline\n"
      print "4. Sort the jobs by posting start date\n"
      print "5. Sort the jobs by posting end date\n"
      print "6. Sort the jobs by positions available\n"
      print "7. Print the job full time/ part time information\n"
      print "8. Print the job temporary/regular information\n"
      print "9. Compare two jobs by typing the first job, and then second job\n"
      print "10. To enter a new keyword to search for a new list of jobs\n"
      print "Type 'quit' to end the program.\n"
    end

    # begin
    # prints message for no results
    # @ensures message for no results is printed
    # end
    def no_results
      print "0 results found. \n"
    end

    # begin
    # prints message for invalid input
    # @ensures message for invalid input is printed
    # end
    def error
      print "That is not a valid input. \n"
    end

    # begin
    # prints title of the job along with its salary range and app. deadline
    # @param job
    #     type job that's title is to be printed
    # @requires
    #     job is of type job and a valid job
    # @ensures title of job is printed along with its salary range and app. deadline
    # end
    def all_results(job)
      # if need smaller windows use this print statement
      printf("%-40<title>s%-40<salary_range>s%-16<app_deadline>s\n",
             title: job.title.to_s, salary_range: job.salary_range.to_s, app_deadline: job.app_deadline.to_s)
      # printf("%-40<title>s%-35<department>s%-40<salary_range>s%-20<app_deadline>s\n",
      #       title: job.title.to_s, department: job.department.to_s,
      #       salary_range: job.salary_range.to_s, app_deadline: job.app_deadline.to_s)
    end

    # begin
    # prints header for job results
    # @ensures header for job results is printed
    # end
    def header_all_results
      printf("%-40<title>s%-40<salary_range>s%-16<app_deadline>s\n",
             title: 'Title', salary_range: 'Salary Range', app_deadline: 'App. Deadline')
      # printf("%-40<title>s%-35<department>s%-40<salary_range>s%-20<app_deadline>s\n",
      #       title: 'Title', department: 'Department',
      #       salary_range: 'Salary Range', app_deadline: 'Application Deadline')
    end

    # begin
    # prints title of the job and min salary of the job
    # @param job
    #     type job that's to be printed
    # @requires
    #     job is of type job and a valid job
    # @ensures
    #     title of job is printed along with min salary
    # end
    def jobs_and_min_salary(job)
      printf("%-50<title>s%-24<amount>s\n", title: job.title.to_s, amount: format_money(job.min_sal.to_s))
    end

    # begin
    # prints title of the job and max salary of the job
    # @param job
    #     type job that's to be printed
    # @requires
    #     job is of type job and a valid job
    # @ensures
    #     title of job is printed along with max salary
    # end
    def jobs_and_max_salary(job)
      printf("%-50<title>s%-24<amount>s\n", title: job.title.to_s, amount: format_money(job.max_sal.to_s))
    end

    # begin
    # prints title of the job and app deadline of the job
    # @param job
    #     type job that's to be printed
    # @requires
    #     job is of type job and a valid job
    # @ensures
    #     title of job is printed along with app deadline
    # end
    def jobs_and_app_deadline(job)
      printf("%-50<title>s%-24<deadline>s\n", title: job.title.to_s, deadline: job.app_deadline.to_s)
    end

    # begin
    # prints title of the job and start date of the job
    # @param job
    #     type job that's to be printed
    # @requires
    #     job is of type job and a valid job
    # @ensures
    #     title of job is printed along with start date
    # end
    def jobs_and_start_date(job)
      printf("%-50<title>s%-24<date>s\n", title: job.title.to_s, date: job.start_date.to_s)
    end

    # begin
    # prints title of the job and end date of the job
    # @param job
    #     type job that is to be printed
    # @requires
    #     job is of type job and a valid job
    # @ensures
    #     title of job is printed along with end date
    # end
    def jobs_and_end_date(job)
      printf("%-50<title>s%-24<date>s\n", title: job.title.to_s, date: job.end_date.to_s)
    end

    # begin
    # prints title of the job and end date of the job
    # @param job
    #     type job that's to be printed
    # @requires
    #     job is of type job and a valid job
    # @ensures
    #     title of job is printed along with end date
    # end
    def jobs_and_pos_avail(job)
      printf("%-50<title>s%-24<avail>s\n", title: job.title.to_s, avail: job.pos_available.to_s)
    end

    # begin
    # prints title of the job and whether it is full time or part time
    # @param job
    #     type job that's to be printed
    # @requires
    #     job is of type job and a valid job
    # @ensures
    #     title of job is printed along with full time/ part time information
    # end
    def jobs_and_full_part(job)
      printf("%-50<title>s%-24<fullpart>s\n", title: job.title.to_s, fullpart: job.full_part.to_s)
    end

    # begin
    # prints title of the job and whether it is temporary or regular
    # @param job
    #     type job that's to be printed
    # @requires
    #     job is of type job and a valid job
    # @ensures
    #     title of job is printed along with temporary or regular information
    # end
    def jobs_and_temp_reg(job)
      printf("%-50<title>s%-24<tempreg>s\n", title: job.title.to_s, tempreg: job.temp_reg.to_s)
    end

    # begin
    # prints all of jobs attributes
    # @param job
    #     type job that's to be printed
    # @requires
    #     job is of type job and a valid job
    # @ensures
    #     job is printed along with all its attributes
    # end
    def print_details(job)
      printf "-----------------------------------------------------------------------------------\n"
      printf("\nTitle: %<title>s\n", title: job.title.to_s)
      printf("Department: %<department>s\n", department: job.department.to_s)
      printf("Application Deadline: %<deadline>s\n", deadline: job.app_deadline.to_s)
      printf("Salary Range: %<salary>s\n", salary: job.salary_range.to_s)
      printf("Positions Available: %<avail>s\n", avail: job.pos_available.to_s)
      printf("Job Category: %<cat>s\n", cat: job.category.to_s)
      printf("Job Appointment (FTE): %<fte>s\n", fte: job.fte.to_s)
      printf("Full/Part Time: %<fullpart>s\n", fullpart: job.full_part.to_s)
      printf("Temporary or Regular: %<tempreg>s\n", tempreg: job.temp_reg.to_s)
      printf("Posting Start Date: %<date>s\n", date: job.start_date.to_s)
      printf("Positing End Date: %<date>s\n", date: job.end_date.to_s)
      printf("Department Contact Name: %<name>s\n", name: job.contact_name.to_s)
      printf("Department Contact Phone: %<phone>s\n", phone: job.contact_phone.to_s)
      printf("\nSummary:\n %<duties>s\n", duties: job.duties_summary.to_s)
      printf("\nRequired Qualifications:\n %<qual>s\n", qual: job.req_qualifications.to_s)
      printf("\nDesired Qualifications:\n %<qual>s\n", qual: job.des_qualifications.to_s)
    end

    # begin
    # formats the salary to include dollar sign and commas
    #
    # @param num
    #     the salary to be formatted
    # @requires num
    #     num is a float and is non-negative
    # @ensures
    #     salary is formatted to represent conventional money format
    # end
    def format_money(num)
      if num == WebScraper::NOT_APPLICABLE
        num
      else
        num[num.length] = '0' if num.index('.') == num.length - 2 # add a 0 if only 1 decimal place given
        WebScraper::MONEY_UNITS + num.gsub(WebScraper::COMMAS_REG_EXP, '\\1,')
      end
    end

    # begin
    # prints a newline to separate output in terminal
    # @ensures newline is printed as output in terminal
    # end
    def newline
      print "\n"
    end

    # begin
    # prints the number of results found from the keyword
    #
    # @param results
    #     array of jobs that are found from the keyword
    # @requires
    #     results is an array of type jobs and all elements are valid jobs
    # @ensures
    #     the number of results is printed
    # end
    def number_of_results(results)
      printf("\n%<results>d results found.\n\n", results: results.length)
    end

    # begin
    # prints the job details of two jobs side by side
    #
    # @param job_one
    #     first job object to be compared
    # @param job_two
    #     second job object to be compared
    # @requires
    #     job_one and job_two are both of type job and are both valid jobs
    # @ensures
    #     the job details are printed in columns side by side
    # end
    def comparing(job_one, job_two)
      printf "-----------------------------------------------------------------------------------\n"
      print "\nTitle:".ljust(35) + job_one.title.to_s.ljust(35) + job_two.title.to_s.ljust(35)
      print "\nDepartment:".ljust(35) + job_one.department.to_s.ljust(35) + job_two.department.to_s.ljust(35)
      print "\nApplication Deadline:".ljust(35) + job_one.app_deadline.to_s.ljust(35)
      print job_two.app_deadline.to_s.ljust(35)
      print "\nSalary Range:".ljust(35) + job_one.salary_range.to_s.ljust(35) + job_two.salary_range.to_s.ljust(35)
      print "\nPositions Available:".ljust(35) + job_one.pos_available.to_s.ljust(35)
      print job_two.pos_available.to_s.ljust(35)
      print "\nJob Catergory:".ljust(35) + job_one.category.to_s.ljust(35) + job_two.category.to_s.ljust(35)
      print "\nJob Appointment (FTE):".ljust(35) + job_one.fte.to_s.ljust(35) + job_two.fte.to_s.ljust(35)
      print "\nFull/Part Time:".ljust(35) + job_one.full_part.to_s.ljust(35) + job_two.full_part.to_s.ljust(35)
      print "\nTemporary or Regular:".ljust(35) + job_one.temp_reg.to_s.ljust(35) + job_two.temp_reg.to_s.ljust(35)
      print "\nPosting Start Date:".ljust(35) + job_one.start_date.to_s.ljust(35) + job_two.start_date.to_s.ljust(35)
      print "\nPosting End Date:".ljust(35) + job_one.end_date.to_s.ljust(35) + job_two.end_date.to_s.ljust(35)
      print "\nDepartment Contact Name:".ljust(35) + job_one.contact_name.to_s.ljust(35)
      print job_two.contact_name.to_s.ljust(35)
      print "\nDepartment Contact Phone:".ljust(35) + job_one.contact_phone.to_s.ljust(35)
      print job_two.contact_phone.to_s.ljust(35) + "\n"
    end

    # begin
    # prints prompt for first job to be compared
    # @ensures message prompt for first job to be compared is printed
    # end
    def comparator_prompt_first_job
      printf "Type the name of the first job you want to compare: \n"
    end

    # begin
    # prints prompt for second job to be compared
    # @ensures message prompt for second job to be compared is printed
    # end
    def comparator_prompt_second_job
      printf "Type the name of the second job you want to compare: \n"
    end
  end
end
