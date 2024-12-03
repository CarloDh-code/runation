class NotifContent < ApplicationRecord
  belongs_to :notification

  validates :content, presence: true, through: :notification
end
