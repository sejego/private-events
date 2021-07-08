class ChangeTableNameInThruTable < ActiveRecord::Migration[6.1]
  change_table :attendings do |t|
    t.rename :event_id, :attended_event_id
  end
end