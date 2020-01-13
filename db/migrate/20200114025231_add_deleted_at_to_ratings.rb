class AddDeletedAtToRatings < ActiveRecord::Migration[5.2]
  def change
    add_column :ratings, :deleted_at, :datetime
  end
end
