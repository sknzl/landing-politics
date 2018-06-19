class Politician < ApplicationRecord
  has_one :party
  has_many :events
end
