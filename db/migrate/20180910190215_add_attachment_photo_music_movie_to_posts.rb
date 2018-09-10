class AddAttachmentPhotoMusicMovieToPosts < ActiveRecord::Migration[5.1]
  def self.up
    change_table :posts do |t|
      t.attachment :photo
      t.attachment :music
      t.attachment :movie
    end
  end

  def self.down
    remove_attachment :posts, :photo
    remove_attachment :posts, :music
    remove_attachment :posts, :movie
  end
end
