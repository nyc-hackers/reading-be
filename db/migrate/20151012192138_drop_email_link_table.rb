class DropEmailLinkTable < ActiveRecord::Migration
  def change
    drop_table :emaillinks
  end
end
