task :cron => :environment do
  puts "Removing stale sessions ..." 
  session_count = CGI::Session::ActiveRecordStore::Session.delete_all(['updated_at < ?', 1.hour.ago])
  puts "#{session_count} sessions removed" 
  puts "done." 
end