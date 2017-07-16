#
# Used to capture/save SVG and also render/save JPG via "rsvg-convert" system binary
#
#require 'rubygems'
require 'sinatra'
require 'slim'
require 'sinatra/asset_pipeline'
register Sinatra::AssetPipeline


#require 'v8'
#set our views path
#set :views, File.dirname(__FILE__) + '/views'

#make pretty HTML if you like (for debugging, maybe)
#set :slim, :pretty => true

#root url
get '/' do
  #slim :index
  "<h1> Hello.</h1> Please POST your SVG data to the /save_svg endpoint within <i>params['data']</i>"
end

#render our application.js file from our CoffeeScript
#get '/application.js' do
#  content_type "text/javascript"
#  coffee :application
#end

#nice wrapper to allow functions to respond to get or post
def self.get_or_post(url,&block)
  get(url,&block)
  post(url,&block)
end

get_or_post '/save_svg' do
  headers 'Access-Control-Allow-Origin' => 'http://localhost:1337'
  #use a timestamp as the title
	file_name = Time.now.to_i

	FOLDER = "works" #okay to change this
  IMG_WIDTH = 8500

	IO.write("#{FOLDER}/#{file_name}.svg",params['data'])
	#NOTE! you may have to customize the bin path on your server...
	`rsvg-convert #{FOLDER}/#{file_name}.svg -w #{IMG_WIDTH} -o #{FOLDER}/#{file_name}.jpg`
end
