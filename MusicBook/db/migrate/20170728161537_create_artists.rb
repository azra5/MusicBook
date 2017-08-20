class CreateArtists < ActiveRecord::Migration[5.1]
  def change
    create_table :artists do |t|
      t.string :name, unique: true, null: false
      t.date :dob
      t.string :placeOfBirth
      t.string :state
      t.string :address

      t.timestamps
    end
  end
end
