class CreateAlbums < ActiveRecord::Migration[7.0]
  def change
    create_table :albums do |t|
      t.string :title
      t.string :artist
      t.string :barcode
      t.string :cover_url
      t.string :record_label
      t.string :release_year
      t.string :edition_year
      t.string :discogs_id

      t.timestamps
    end
  end
end
