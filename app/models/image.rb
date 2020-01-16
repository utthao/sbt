class Image < ApplicationRecord
  after_destroy :remove_id_directory
  belongs_to :tour

  mount_uploader :path, ImageUploader

  protected
    def remove_id_directory
      FileUtils.remove_dir("#{Rails.root}/public/uploads/image/image/#{@id}", :force => true)
    end
end
