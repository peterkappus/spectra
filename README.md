# spectra
Beautiful, realtime, information for your home. Playable on your crappy old first-gen iPad.

## Installing gulp
Usually have to do this as sudo to do it globally
```
sudo npm install -g gulp
npm install --save-dev gulp
```

## Run it...
Start gulp in the background:
`gulp &`

Now visit http://localhost:1337

## Using docker

### First time
  `docker build -t spectra .`

### Future times
```
docker run -p 8080:1337 -p 5000:5000 -v $(pwd):/app  -it spectra bash
#from within the container
gulp &
#sinatra (bind to 0.0.0.0 so it's accessible outside our container)
ruby app.rb -p 5000 -o 0.0.0.0
```

## Saving SVGs
Okay, this part gets weird. TODO: port this to ExpressJS so we don't have to use Ruby... For now this allows you to save SVGS locally by running a Sinatra app. It won't work when you deploy just the static front-end files to AWS, for example...

- Install ruby
- Install rsvg-convert for converting SVG to JPGs. The easiest way to install on a Mac is with [Homebrew](http://brew.sh/):

```bash
brew install watch
#brew install coffee
brew install librsvg
brew install v8
gem install therubyracer
gem install libv8 -v '3.16.14.11' -- --with-system-v8
bundle install

```
NOTE: if you have issues with the above, you may have to `gem uninstall v8`

### Starting sinatra:
- cd into the sinatra folder
- `bundle exec shotgun app.rb &` This starts a server (in the background) on http://localhost:9393

NOTE: The "Access-Control-Allow-Origin" header in the Sinatra app must match the host and port of the Express app serving up the gulp-rendered static pages on your localhost.

Works will be saved in the "works" folder in the root.


## Deploy to S3 (front-end only)
To deploy just the static HTML/JS files which allows you to make pretty pictures and take screenshots (but not capture SVGs) Make a `deploy.sh` file like so:
```
s3cmd sync dist/ s3://<BUCKET_NAME> --delete-removed -P --rexclude=.git*
```
(NOTE: you'll need s3cmd to do this...)
