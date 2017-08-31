class Feed < ApplicationRecord
  has_many :articles, dependent: :destroy

  validates :url, presence: true, uniqueness: true
end
