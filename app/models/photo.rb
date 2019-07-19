class Photo < ApplicationRecord
	mount_uploader :name, GalleryUploader
	belongs_to :project, inverse_of: :photos
end
