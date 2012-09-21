class AddYoutubeData < ActiveRecord::Migration
  def change
    add_column :contents, :page_type, :string
    add_column :contents, :page_order, :integer

    create_table :content_videos do |t|
      t.string :video_uri
      t.integer :content_id
    end
  end
end
