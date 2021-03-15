class Article < ApplicationRecord
  validates :title, presence: true, length: {minimum: 3, maximum: 150}
  validates :description, presence: true, length: {minimum: 3, maximum: 2500}


end
