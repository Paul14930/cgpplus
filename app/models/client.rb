class Client < ApplicationRecord
  has_many :entreprises
  belongs_to :cgp
  has_many :immobiliers, as: :proprietable
end
