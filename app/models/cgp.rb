class Cgp < ApplicationRecord
  belongs_to :banque, optional: true
  has_many :clients
end
