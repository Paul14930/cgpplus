class Client < ApplicationRecord
  has_many :entreprises
  belongs_to :cgp
end
