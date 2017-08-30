class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.datetime :published_at
      t.references :feed

      t.timestamps
    end
    add_foreign_key :articles, :feeds
    add_index :articles, [:title, :published_at, :feed_id]
  end
end
