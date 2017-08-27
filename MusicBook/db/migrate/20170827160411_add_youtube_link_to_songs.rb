class AddYoutubeLinkToSongs < ActiveRecord::Migration[5.1]
  def change
    add_column :songs, :ytlink, :string
  end
end
