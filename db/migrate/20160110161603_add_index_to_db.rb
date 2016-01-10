class AddIndexToDb < ActiveRecord::Migration
  def change
  	add_index :attendee_interests, :attendee_id
  	add_index :attendee_interests, :interest_id
  	add_index :attendees, :importance
  end
end
