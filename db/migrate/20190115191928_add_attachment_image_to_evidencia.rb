class AddAttachmentImageToEvidencia < ActiveRecord::Migration[5.0]
  def self.up
    change_table :evidencia do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :evidencia, :image
  end
end
