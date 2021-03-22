class Comment < ApplicationRecord

  validates :description, presence: true, length: {minimum: 2, maximum: 1000}
  belongs_to :article
  belongs_to :user
  validates :user_id, presence: true
  validates :article_id, presence: true
  default_scope { order(updated_at: :desc)}
end
