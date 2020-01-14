class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.references :account, null: false, foreign_key: true
      t.references :review, null: false, foreign_key: true
      t.bigint :account_id
      t.bigint :review_id
      t.string :status

      t.timestamps
    end
  end
end
