class Message < ApplicationRecord

  validates :content, presence: true

  belongs_to :user
  validates :user_id, presence:true

  def self.most_recent
    order(:created_at).last(20)
  end
end
