class Article < ApplicationRecord
  belongs_to :feed, foreign_key: :feed_id, class_name: 'Article',
                    inverse_of: :articles

  validates :title, :published_at, presence: true
end
