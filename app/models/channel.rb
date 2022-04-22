class Channel < ApplicationRecord
	mount_uploader :image, ImageUploader
	has_many :shows

	def self.search(search)
		if search != ""
			self.where(name: search)
		else
			@channels=Channel.all
		end
	end
end
