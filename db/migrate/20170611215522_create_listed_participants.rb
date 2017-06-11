class CreateListedParticipants < ActiveRecord::Migration[5.1]
  def change
    create_table :listed_participants do |t|
      t.integer :visitor_id
      t.integer :event_id
      t.string :access_level
      t.datetime :check_in
      t.datetime :check_out

      t.timestamps
    end
  end
end
