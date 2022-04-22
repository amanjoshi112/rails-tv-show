class AddChannelIdToShow < ActiveRecord::Migration[7.0]
  def change
    add_column :shows, :channel_id, :integer
  end
end
