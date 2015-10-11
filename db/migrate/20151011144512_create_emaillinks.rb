class CreateEmaillinks < ActiveRecord::Migration
  def change
    create_table :emaillinks do |t|
      t.datetime :accept_or_rejected_at
      t.boolean :accepted
      t.integer :cnt_title_words
      t.string :email_subject
      t.string :from_email
      t.string :from_name
      t.string :url
      t.string :title
      t.integer :label_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
