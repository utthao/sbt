class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references :account, null: false, foreign_key: true
      t.references :tour, null: false, foreign_key: true
      t.bigint :account_id
      t.bigint :tour_id
      t.text :title
      t.text :content
      t.string :status

      t.timestamps
    end
  end
end
