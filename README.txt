Ruby Version : 2.3.0
Ruby Gemset : rss-reader

How to run app :
- install postgresql
- Run "bundle install"
- Run "rake db:create"
- Run "rake db:migrate"
- To start server, Run "RAILS_ENV=development rails s"

- To sync feed articles
  - Manually(through rake task) : RAILS_ENV=development bundle exec rake rss_feed:update
  - Automatic(through cron, runs every 30 mins) : whenever --set 'environment=development' --update-crontab
