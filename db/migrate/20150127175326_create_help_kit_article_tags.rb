class CreateHelpKitArticleTags < ActiveRecord::Migration
  def change
    create_table :help_kit_article_tags do |t|
      t.references :tag, index: true
      t.references :article, index: true

      t.timestamps null: false
    end
    add_foreign_key :help_kit_article_tags, :tags
    add_foreign_key :help_kit_article_tags, :articles
  end
end
