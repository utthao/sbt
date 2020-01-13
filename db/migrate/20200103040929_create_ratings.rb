class CreateRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :ratings do |t|
      t.references :account, null: false, foreign_key: true
      t.references :tour, null: false, foreign_key: true
      t.references :booking, null: false, foreign_key: true
      t.bigint :account_id
      t.bigint :tour_id
      t.bigint :booking_id
      t.float :star
      t.text :comment
      t.integer :status

      t.timestamps
    end
  end
end
