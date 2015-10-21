class AddColumnToEmailLinks < ActiveRecord::Migration
  def change
    add_column :email_links, :read, :boolean
  end
end
