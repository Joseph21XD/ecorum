class Evento < ApplicationRecord
  belongs_to :usuario
  belongs_to :tipo_evento
  belongs_to :provincium
  has_many :comentarios
  has_many :favoritos
  has_many :comprobacions
end
