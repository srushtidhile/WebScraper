# frozen_string_literal: true

require_relative 'spec_helper'
require_relative '../jobs_parser'
require 'mechanize'

RSpec.describe WebScraper::JobsParser do
  it 'The JobsParser class should have some jobs present' do
    parser = WebScraper::JobsParser.new
    parser.search('') # gets all jobs on the site
    expect(parser.jobs.length).to be > 0
  end
  it 'The jobs in the JobsParser class should have titles' do
    parser = WebScraper::JobsParser.new
    parser.search('') # gets all jobs on the site
    parser.jobs.each { |job| expect(job.title).not_to be_nil }
  end
  it 'The jobs in the JobsParser class should have departments' do
    parser = WebScraper::JobsParser.new
    parser.search('') # gets all jobs on the site
    parser.jobs.each { |job| expect(job.department).not_to be_nil }
  end
  it 'The jobs in the JobsParser class should have application deadlines' do
    parser = WebScraper::JobsParser.new
    parser.search('') # gets all jobs on the site
    parser.jobs.each { |job| expect(job.app_deadline).not_to be_nil }
  end
  it 'The jobs in the JobsParser class should have salaries' do
    parser = WebScraper::JobsParser.new
    parser.search('') # gets all jobs on the site
    parser.jobs.each { |job| expect(job.salary_range).not_to be_nil }
  end
  it 'The jobs in the JobsParser class should have positions available fields' do
    parser = WebScraper::JobsParser.new
    parser.search('') # gets all jobs on the site
    parser.jobs.each { |job| expect(job.pos_available).not_to be_nil }
  end
  it 'The jobs in the JobsParser class should have duties summaries' do
    parser = WebScraper::JobsParser.new
    parser.search('') # gets all jobs on the site
    parser.jobs.each { |job| expect(job.duties_summary).not_to be_nil }
  end
  it 'The jobs in the JobsParser class should have required qualifications' do
    parser = WebScraper::JobsParser.new
    parser.search('') # gets all jobs on the site
    parser.jobs.each { |job| expect(job.req_qualifications).not_to be_nil }
  end
  it 'The jobs in the JobsParser class should have desired qualifications' do
    parser = WebScraper::JobsParser.new
    parser.search('') # gets all jobs on the site
    parser.jobs.each { |job| expect(job.des_qualifications).not_to be_nil }
  end
  it 'The jobs in the JobsParser class should have categories' do
    parser = WebScraper::JobsParser.new
    parser.search('') # gets all jobs on the site
    parser.jobs.each { |job| expect(job.category).not_to be_nil }
  end
  it 'The jobs in the JobsParser class should have ftes' do
    parser = WebScraper::JobsParser.new
    parser.search('') # gets all jobs on the site
    parser.jobs.each { |job| expect(job.fte).not_to be_nil }
  end
  it 'The jobs in the JobsParser class should be full or part time' do
    parser = WebScraper::JobsParser.new
    parser.search('') # gets all jobs on the site
    parser.jobs.each { |job| expect(job.full_part).not_to be_nil }
  end
  it 'The jobs in the JobsParser class should regular or temporary' do
    parser = WebScraper::JobsParser.new
    parser.search('') # gets all jobs on the site
    parser.jobs.each { |job| expect(job.temp_reg).not_to be_nil }
  end
  it 'The jobs in the JobsParser class should have start dates' do
    parser = WebScraper::JobsParser.new
    parser.search('') # gets all jobs on the site
    parser.jobs.each { |job| expect(job.start_date).not_to be_nil }
  end
  it 'The jobs in the JobsParser class should have end dates' do
    parser = WebScraper::JobsParser.new
    parser.search('') # gets all jobs on the site
    parser.jobs.each { |job| expect(job.end_date).not_to be_nil }
  end
  it 'The jobs in the JobsParser class should have contact names' do
    parser = WebScraper::JobsParser.new
    parser.search('') # gets all jobs on the site
    parser.jobs.each { |job| expect(job.contact_name).not_to be_nil }
  end
  it 'The jobs in the JobsParser class should have contact phones' do
    parser = WebScraper::JobsParser.new
    parser.search('') # gets all jobs on the site
    parser.jobs.each { |job| expect(job.contact_phone).not_to be_nil }
  end
end
