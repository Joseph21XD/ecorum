class Favorito < ApplicationRecord
  belongs_to :usuario
  belongs_to :evento
end
