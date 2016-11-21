class CreateFeaturedAttendees < ActiveRecord::Migration[5.0]
  def change
    create_table :featured_attendees do |t|
      t.string :first_name
      t.string :last_name
      t.string :country
      t.string :title
      t.string :company
      t.integer :importance
      t.string :bio
      t.string :interests
      t.string :thumbnail_url
      t.string :image_url

      t.timestamps
    end
  end
end
