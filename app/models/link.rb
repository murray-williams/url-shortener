class Link < ApplicationRecord
  validates :long_url, presence: true
end
