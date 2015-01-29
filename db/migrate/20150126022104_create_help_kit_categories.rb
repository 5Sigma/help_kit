class CreateHelpKitCategories < ActiveRecord::Migration
  def change
    create_table :help_kit_categories do |t|
      t.string :name
      t.string :slug
      t.references :parent, index: true
      t.integer :lft
      t.integer :rgt
      t.integer :depth
      t.integer :children_count
      t.text :header_content
      t.timestamps null: false
    end
  end
end
