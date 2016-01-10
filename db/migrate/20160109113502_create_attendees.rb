class CreateAttendees < ActiveRecord::Migration
  def change
    create_table :attendees do |t|
      t.string :first_name
      t.string :last_name
      t.string :country
      t.string :title
      t.string :company
      t.integer :importance
      t.text :bio
      t.string :thumbnail_url
      t.string :image_url

      t.timestamps null: false
    end
  end
end
