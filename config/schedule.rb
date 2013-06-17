# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
#set :output, 'log/cron.log'
set :output, 'log/cron.log'
set :environment, :development
every 1.minute do
  runner "BatchUpdate.execute"
end
every 1.minute do
  runner "BatchUpdate.blog_count"
end
#every :monday, :at => '4:30 am' do
every 3.minute do
	runner "BatchUpdate.blog_count_week"
end

every 5.minute do
	runner "BatchUpdate.blog_count_month"
end