class AddDeletedAtToImages < ActiveRecord::Migration[5.2]
  def change
    add_column :images, :deleted_at, :datetime
  end
end
