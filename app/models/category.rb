class Category < ApplicationRecord

  validates :name, presence: true, uniqueness: true, length: {minimum: 2, maximum: 25}



end
