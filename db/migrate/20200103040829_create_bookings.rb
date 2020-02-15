class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :account, null: false, foreign_key: true
      t.references :tour, null: false, foreign_key: true
      t.bigint :account_id
      t.bigint :tour_id
      t.integer :amount
      t.datetime :start_day
      t.datetime :end_day
      t.bigint :total_price
      t.integer :status
      t.string :rated

      t.timestamps
    end
  end
end
