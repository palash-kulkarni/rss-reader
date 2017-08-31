module RssFeed
  def sync_articles
    Feed.all.each do |feed|
      begin
        rss = RSS::Parser.parse(feed.url, false)
        if rss.present?
          rss.items.each do |parsed_article|
            fetched_article = Article.find_by(title: parsed_article.title)
            article_hash = rss.feed_type.eql?('rss') ? rss_article_hash(fetched_article, parsed_article, feed) : atom_article_hash(fetched_article, parsed_article, feed)
            fetched_article ? fetched_article.update_attributes(article_hash) : Article.create(article_hash)
          end
        end
      rescue RuntimeError => err
        puts "Error encountered : #{err}"
      end
    end
  end

  def rss_article_hash fetched_article, parsed_article, feed
    result_hash = { description: parsed_article.description,
                    published_at: parsed_article.pubDate,
                    link: parsed_article.link }
    return result_hash if fetched_article
    result_hash[:title] = parsed_article.title
    result_hash[:feed_id] = feed.id
    result_hash
  end

  def atom_article_hash fetched_article, parsed_article, feed
    result_hash = { description: parsed_article.content,
                    published_at: parsed_article.published,
                    link: parsed_article.link.href }
    return result_hash if fetched_article
    result_hash[:title] = parsed_article.title
    result_hash[:feed_id] = feed.id
    result_hash
  end
end
