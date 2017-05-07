#start gulp and sinatra in the background...
#NOTE: you'll have to use 'kill -KILL <pid>' to kill off the processes 

gulp &
#pid1 = $!
cd sinatra
bundle exec shotgun app.rb &
#pid2 = $!
#echo "$pid1 $pid2"
