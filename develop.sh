#start gulp and sinatra in the background...
#NOTE: you'll have to use 'kill -KILL <pid>' to kill off the processes 

gulp &
cd sinatra
bundle exec shotgun app.rb &
