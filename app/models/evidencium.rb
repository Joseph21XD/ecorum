class Evidencium < ApplicationRecord
  belongs_to :comprobacion
  has_attached_file :image
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
