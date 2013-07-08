class EntriesBelongToCollections < ActiveRecord::Migration
  def change
    add_column :entries, :collection_id, :integer
  end
end
