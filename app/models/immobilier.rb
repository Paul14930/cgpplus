class Immobilier < ApplicationRecord
  belongs_to :proprietable, polymorphic: true

end
