class AddCollection < ActiveRecord::Migration
  def change
    create_table :collections do |t|
      t.string :name
      t.string :slug

      t.timestamps
    end

    add_index :collections, :slug, unique: true
  end
end
