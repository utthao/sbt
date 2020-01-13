class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.references :tour, null: false, foreign_key: true
      t.bigint :tour_id
      t.string :path

      t.timestamps
    end
  end
end
