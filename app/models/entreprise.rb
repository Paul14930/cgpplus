class Entreprise < ApplicationRecord
  belongs_to :client, optional: true
  belongs_to :entreprise_mere, class_name: 'Entreprise', optional: true
  has_many :filiales, class_name: 'Entreprise', foreign_key: 'entreprise_mere_id'
  has_many :immobiliers, as: :proprietable
end
