class CreateDraftVideos < ActiveRecord::Migration
  def change
    create_table :draft_videos do |t|
      t.string :title
      t.string :url

      t.timestamps
    end
  end
end
