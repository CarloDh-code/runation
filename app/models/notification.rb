class Notification < ApplicationRecord
  belongs_to :player

  validates :content, presence: true
  # validates :link, presence: true
end
