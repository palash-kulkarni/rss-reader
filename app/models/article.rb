class Article < ApplicationRecord
  belongs_to :feed, foreign_key: :feed_id

  validates :title, :link, :published_at, :description, presence: true
end
