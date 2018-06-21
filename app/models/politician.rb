class Politician < ApplicationRecord
  belongs_to :party
  has_many :events
end
