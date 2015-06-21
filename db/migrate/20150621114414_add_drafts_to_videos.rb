class AddDraftsToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :draft_id, :integer
    add_column :videos, :published_at, :timestamp
    add_column :videos, :trashed_at, :timestamp
  end
end
