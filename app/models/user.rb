class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

          # Ajout de l'énumération pour les rôles
          belongs_to :cgp, optional: true
          belongs_to :banque, optional: true
  enum role: { admin: 'admin', banque: 'banque', cgp: 'cgp' }
end
