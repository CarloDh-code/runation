class Game < ApplicationRecord
  validates :status, presence: true, inclusion: { in: ["ongoing", "pending", "finish"] }
end
