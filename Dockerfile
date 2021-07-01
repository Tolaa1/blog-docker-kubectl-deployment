# set base image 
FROM ruby:2.7.3
# RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
# set the working directory in the container
WORKDIR /blog

# copy the depencies file to the working directory
COPY Gemfile Gemfile.lock ./

# install dependencies
RUN bundle install 

# copy the content to the working directory
COPY . .

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"] 