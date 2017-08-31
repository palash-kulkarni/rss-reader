require 'rss'
require 'rss_feed'

include RssFeed

namespace :rss_feed do
  task update: :environment do
    sync_articles
  end
end
