# frozen_string_literal: true

# begin
#   WebScraper module that will be used to store all the classes and methods used for this project
# end
module WebScraper
  # Job class containing all the information for one job
  class Job
    attr_accessor :title, :department, :app_deadline, :salary_range, :pos_available, :duties_summary,
                  :req_qualifications, :des_qualifications, :category, :fte, :full_part, :temp_reg,
                  :start_date, :end_date, :contact_name, :contact_phone

    # begin
    #   Returns an integer representation of the min salary
    #
    #   @ensures min_sal = minimum salary for the job based on salary_range
    #   @returns the minimum salary for the job based on salary_range
    # end
    def min_sal
      text = @salary_range.split ' '
      min = if text.length >= WebScraper::SAL_RANGE_LENGTH_ONE_NUM
              to_annual(text[WebScraper::SAL_RANGE_MIN_POS].delete(WebScraper::MONEY_FORMATTING).to_f, text.last)
            else
              WebScraper::NOT_APPLICABLE
            end
      min
    end

    # begin
    #   Returns an integer representation of the max salary
    #
    #   @ensures max_sal = maximum salary for the job based on salary_range
    #   @returns the maximum salary for the job based on salary_range
    # end
    def max_sal
      text = @salary_range.split ' '
      max = if text.length < WebScraper::SAL_RANGE_LENGTH_ONE_NUM
              WebScraper::NOT_APPLICABLE
            elsif text.length < WebScraper::SAL_RANGE_LENGTH_TWO_NUM
              to_annual(text[WebScraper::SAL_RANGE_MIN_POS].delete(WebScraper::MONEY_FORMATTING).to_f, text.last)
            else
              to_annual(text[WebScraper::SAL_RANGE_MAX_POS].delete(WebScraper::MONEY_FORMATTING).to_f, text.last)
            end
      max
    end

    # begin
    #   Converts the given salary to an annual salary if it isn't already
    #
    #   @param num
    #           the number to be converted
    #   @param type
    #           either annual or hourly
    #   @ensures to_annual = num $/hour * 40 hours/week * 52 weeks/year if type == hourly
    #   @returns num $/hour * 40 hours/week * 52 weeks/year if type == hourly
    # end
    def to_annual(num, type)
      amount = if type.casecmp(WebScraper::SAL_TYPE_HOURLY).zero?
                 # 100s are for making it round to 2 decimal places
                 (num * WebScraper::HOURS_A_WEEK * WebScraper::WEEKS_A_YEAR * 100).round / 100.0
               else
                 num
               end
      amount
    end
  end
end
