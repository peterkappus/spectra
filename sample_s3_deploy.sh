#install the s3cmd tool to easily push to an amazon s3 bucket
#once you've done that, copy this file to something like 'deploy.sh'
#change "your.bucket.name" to the name of the bucket you want to deploy to
#then run this everytime you want to upload files to S3
s3cmd sync dist/ s3://your.bucket.name --delete-removed -P

