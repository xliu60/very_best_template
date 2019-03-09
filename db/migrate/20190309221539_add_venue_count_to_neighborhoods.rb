class AddVenueCountToNeighborhoods < ActiveRecord::Migration[5.1]
  def change
    add_column :neighborhoods, :venues_count, :integer
  end
end
