# frozen_string_literal: true

class DeviseCreateModelUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :model_users do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      # t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Confirmable
      t.string   :confirmation_token
      t.string   :confirmation_number # PTW Custom
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      # Custom Attributes
      t.string :type
      t.string :name
      t.string :nickname
      t.string :phonenumber
      t.string :status

      # New
      t.datetime :terms_agreed_at
      t.string :sign_up_step
      t.boolean :past_user, default: false
      t.boolean :phonenumber_certified, default: false

      # CounterCache
      # t.integer :plays_count, default: 0, null: false

      t.timestamps null: false

      # Custom Indexes
      # t.index :status
      # t.index :type
      t.index [:type, :nickname]
      t.index :phonenumber
      t.index :name
      # t.index :nickname#, unique: true
      # t.index [:type, :sign_up_step]

      t.index :email
      t.index [:type, :email]
      t.index :reset_password_token, unique: true
    end

    # add_index :model_users, :email #,                unique: true
    # add_index :model_users, :reset_password_token, unique: true
    # add_index :model_users, :confirmation_token,   unique: true
    # add_index :model_users, :unlock_token,         unique: true
  end
end
