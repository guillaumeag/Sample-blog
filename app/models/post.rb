class Post < ApplicationRecord
  has_many :comments

  validates :title, presence: true,
              length: { minimum: 2 }

  scope :published, -> { where(published: true) }
  scope :find_by_title, ->(search) { where("title LIKE ?", "%#{search}%") }
end
