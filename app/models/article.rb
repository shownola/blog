class Article < ApplicationRecord
  validates :title, presence: true, length: {minimum: 3, maximum: 150}
  validates :description, presence: true, length: {minimum: 3, maximum: 2500}

  belongs_to :user
  validates :user_id, presence: true
  has_many :article_categories
  has_many :categories, through: :article_categories
  has_many :comments, dependent: :destroy


end
