class Movie < ApplicationRecord
  has_many :bookmarks
  has_and_belongs_to_many :bookmarks
  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true
end
