# Flutter CI/CD workshop jenkins setup
The docker images provided here https://cloud.docker.com/repository/docker/bitsydarel already contains ruby

# create Gemfile in the root of your project.
touch Gemfile

# pass the following content into the gem file
echo 'source "https://rubygems.org"' >> Gemfile
echo 'gem "fastlane"' >> Gemfile

# install the dependencies in the vendor/bundle or just omit the path.
bundle install --path vendor/bundle
bundle update # to update the dependencies.

# create alias for the fastlane command
alias fastlane="bundle exec fastlane"

# run the fastlane init in the platform folders android and ios
cd android && fastlane init

# enter the info about your project.
# We won't post to goole play for this tutorial but you can found the required steps here
# https://docs.fastlane.tools/actions/supply/

# next move to the ios folder
cd ../ios && fastlane init

https://docs.fastlane.tools/best-practices/continuous-integration/jenkins/
