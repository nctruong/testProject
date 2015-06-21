class CreateDrafts < ActiveRecord::Migration
  def change
    create_table :drafts do |t|
      t.string :title
      t.string :url

      t.timestamps
    end
  end
end
