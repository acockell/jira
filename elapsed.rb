require 'date'

@created, @completed = ARGV

created_at = DateTime.iso8601(@created)
completed_at = DateTime.iso8601(@completed)
elapsed = completed_at - created_at
puts '%.2f' % (elapsed*(24/1)*(60/1)) # minutes
