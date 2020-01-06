class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :account, null: false, foreign_key: true
      t.references :review, null: false, foreign_key: true
      t.bigint :review_id
      t.bigint :account_id
      t.string :content

      t.timestamps
    end
  end
end
