require 'date'
#usage: ruby elapsed.rb "2014-10-27T17:00:45.000-0700" "2014-10-27T18:53:11.000-0700"

@created, @completed = ARGV

created_at = DateTime.iso8601(@created)
completed_at = DateTime.iso8601(@completed)
elapsed = completed_at - created_at
puts '%.2f' % (elapsed*(24/1)*(60/1)) # minutes
