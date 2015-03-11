class CreateHelpKitTags < ActiveRecord::Migration
  def change
    create_table :help_kit_tags do |t|
      t.string :name
      t.timestamps null: false
    end
  end
end
