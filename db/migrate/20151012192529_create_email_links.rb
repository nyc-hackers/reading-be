class CreateEmailLinks < ActiveRecord::Migration
  def change
    create_table :email_links do |t|
      t.datetime :accept_or_rejected_at
      t.boolean :accepted
      t.integer :cnt_title_words
      t.string :email_subject, null: false
      t.string :from_email, null: false
      t.string :from_name, null: false
      t.string :url, null: false
      t.string :title, null: false
      t.integer :label_id
      t.integer :user_id
      
      t.timestamps null: false
    end
  end
end
