# spectra
Beautiful, realtime, information for your home. Playable on your crappy old first-gen iPad.

## Installing gulp
Usually have to do this as sudo to do it globally
```
sudo npm install -g gulp
npm install --save-dev gulp
```

## Run it...
Start gulp:
`gulp`

Now visit http://localhost:1337

## Deploy to S3:
Make a `deploy.sh` file like so:
```
s3cmd sync dist/ s3://<BUCKET_NAME> --delete-removed -P --rexclude=.git*
```
(NOTE: you'll need s3cmd to do this...) 
