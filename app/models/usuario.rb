class Usuario < ApplicationRecord
  has_many :eventos
  has_many :comentarios
  has_many :favoritos
  has_many :comprobacions
  belongs_to :tipo_usuario
  has_attached_file :image
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
