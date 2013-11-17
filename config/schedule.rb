set :output, "#{path}/log/cron.log"
set :environment, :development
every 15.minute, roles: [:whenever] do
  runner "BatchUpdate.execute"
end
every 1.hours, roles: [:whenever] do
  runner "BatchUpdate.yahoo"
end
every 1.hours, roles: [:whenever] do
  runner "BatchUpdate.twitter"
end