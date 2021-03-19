class Article < ApplicationRecord
  validates :title, presence: true, length: {minimum: 3, maximum: 150}
  validates :description, presence: true, length: {minimum: 3, maximum: 2500}

  belongs_to :user
  has_many :article_categories
  has_many :categories, through: :article_categories 


end
