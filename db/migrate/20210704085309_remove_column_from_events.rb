class RemoveColumnFromEvents < ActiveRecord::Migration[6.1]
  def change
    remove_column :events, :attendee_id
  end
end
