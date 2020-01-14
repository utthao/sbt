class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.string :name
      t.string :email
      t.string :phone_number
      t.string :avatar
      t.string :active_status
      t.string :activation_digest
      t.string :remember_digest
      t.string :password_digest
      t.integer :role

      t.timestamps
    end
  end
end
