class Comprobacion < ApplicationRecord
  belongs_to :usuario
  belongs_to :evento
  has_many :evidencia
end
