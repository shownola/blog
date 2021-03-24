class Message < ApplicationRecord

  validates :content, presence: true

  belongs_to :user
  validates :user_id, presence:true

end
