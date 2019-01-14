class AddAttachmentImageToEventos < ActiveRecord::Migration[5.0]
  def self.up
    change_table :eventos do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :eventos, :image
  end
end
