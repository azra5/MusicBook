class CreatePlaylists < ActiveRecord::Migration[5.1]
  def change
    create_table :playlists do |t|
      t.string :name
      t.integer :numOfSongs
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
