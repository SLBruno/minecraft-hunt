class AddChannelidToVideo < ActiveRecord::Migration
  def change
  	add_column :videos, :channelid, :string
  end
end
