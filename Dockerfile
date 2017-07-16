# Use an official Python runtime as a parent image
FROM node

RUN mkdir /app

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
ADD . /app

RUN apt-get update; apt-get install -y ruby ruby-dev librsvg2-bin
RUN gem install bundle
RUN bundle
RUN npm install -g gulp; npm install --save-dev gulp express

#for gulp
EXPOSE 1337

#for sinatra
EXPOSE 5000


#docker build -t spectra .
#docker run -p 8080:1337 -p 5000:5000  -it spectra bash
#then run gulp & to start the gulp server and
# ruby sinatra/app.rb -p 5000 # to start sinatra
