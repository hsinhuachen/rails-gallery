class Project < ApplicationRecord
	mount_uploader :thumb, ImageUploader
	has_many :photos, -> {  order('sorting asc') }, dependent: :destroy, inverse_of: :project
	accepts_nested_attributes_for :photos
end
