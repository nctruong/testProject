class AddUidToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :uid, :string
    add_column :videos, :description, :text
    add_column :videos, :views, :integer
    add_column :videos, :likes, :integer
  end
end
