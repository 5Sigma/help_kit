class CreateHelpKitArticles < ActiveRecord::Migration
  def change
    create_table :help_kit_articles do |t|
      t.string :title
      t.boolean :published
      t.text :content
      t.text :description
      t.datetime :published_at
      t.integer :view_count
      t.references :creator, index: true
      t.references :last_editor, index: true
      t.references :category, index: true
      t.references :parent_article, index: true
      t.string :slug
      t.timestamps null: false
    end
  end
end
