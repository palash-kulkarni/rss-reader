class Feed < ApplicationRecord
  has_many :articles, foreign_key: 'feed_id', class_name: 'Feed',
                      dependent: :destroy, inverse_of: :feed

  validates :url, presence: true, uniqueness: true
end
