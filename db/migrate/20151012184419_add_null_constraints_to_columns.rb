class AddNullConstraintsToColumns < ActiveRecord::Migration
  def change
    change_column_null(:emaillinks, :title, false)
    change_column_null(:emaillinks, :url, false)
    change_column_null(:emaillinks, :from_name, false)
    change_column_null(:emaillinks, :from_email, false)
    change_column_null(:emaillinks, :email_subject, false)
  end
end
