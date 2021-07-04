class AddUserToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :creator_id, :integer
    add_column :events, :attendee_id, :integer
  end
end
