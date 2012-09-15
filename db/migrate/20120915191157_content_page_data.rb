class ContentPageData < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string :page_id
      t.string :title
      t.string :subtitle
    end
    create_table :content_texts do |t|
      t.text :body_text
      t.integer :content_id
    end
    create_table :content_images do |t|
      t.string :image_uri
      t.integer :content_id
    end
  end

end
