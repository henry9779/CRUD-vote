namespace :db do
  desc 'Reset Counter Cache'
  task :reset_counter => :environment do
    puts 'Reset'
    Candidate.all.each do |candidate|
      Candidate.reset_counters(candidate.id, :votelogs)
    end

  end
end