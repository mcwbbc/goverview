require 'rubygems'
require 'bio'

namespace :journals do

  desc "Updates the Journals table using the PMC open access csv file: http://www.ncbi.nlm.nih.gov/pmc/journals/#csvfile"
  task :update_from_jlist, :file, :needs => :environment do |t,args|
    puts "Importing jlist file"
    args.with_defaults(:file => 'jlist.csv')
    
    the_file = args[:file]
    File.open(the_file,"r") do |file|

      while (row = file.gets)
        # Skip the header row
        next if row =~ /^Journal title,NLM TA/
        Journal.update_from_pmc_journal_list(row)
      end
    end
    
    puts "Loaded jLIst data from #{the_file}, #{Journals.count(:all)} journals after loading"
  end
end