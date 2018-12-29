class Usuario < ApplicationRecord
  has_many :eventos
  has_many :comentarios
  has_many :favoritos
  has_many :comprobacions
  belongs_to :tipo_usuario
end
