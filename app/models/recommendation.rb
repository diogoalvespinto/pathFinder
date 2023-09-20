class Recommendation < ApplicationRecord
  belongs_to :logbook, dependent: :destroy
end
