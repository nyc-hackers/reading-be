class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      ##Omniauth
      t.string :provider, null: false
      t.string :uid, null: false
      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at


      t.timestamps null: false
    end

    add_index :users, :provider
    add_index :users, :uid, unique: true
  end
end
