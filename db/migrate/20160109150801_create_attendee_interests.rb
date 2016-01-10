class CreateAttendeeInterests < ActiveRecord::Migration
  def change
    create_table :attendee_interests do |t|
      t.integer :attendee_id
      t.integer :interest_id

      t.timestamps null: false
    end
  end
end
