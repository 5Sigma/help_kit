class CreateHelpKitArticleTags < ActiveRecord::Migration
  def change
    create_table :help_kit_article_tags do |t|
      t.references :tag, index: true
      t.references :article, index: true
      t.timestamps null: false
    end
  end
end
