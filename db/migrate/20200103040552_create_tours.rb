class CreateTours < ActiveRecord::Migration[5.2]
  def change
    create_table :tours do |t|
      t.references :account, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.bigint :account_id
      t.bigint :category_id
      t.text :title
      t.text :content
      t.string :image
      t.float :avg_rate, :default => 0
      t.integer :rate_amount, :default => 0
      t.bigint :price
      t.integer :status
      t.datetime :start_day
      t.datetime :end_day
      t.timestamps
    end
    add_index :tours, [:account_id, :created_at]
  end
end
