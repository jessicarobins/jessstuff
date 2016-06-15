class TicketTrackerId < ActiveRecord::Migration
  def change
    
    add_column :tickets, :deleted_at, :time
    add_column :tickets, :deleted_by_id, :int
    add_column :tickets, :tracker_id, :string
    
    
  end
end
