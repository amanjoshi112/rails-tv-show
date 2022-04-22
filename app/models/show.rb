class Show < ApplicationRecord
	mount_uploader :image, ImageUploader
	belongs_to :channel
	has_many :favorites, dependent: :destroy

	def self.search(search)
		if search != ""
			self.where(name: search)
		else
			@shows=Show.all
		end
	end


	# attr_accessor :time

	# def format_time
	#     self.time.strftime '%I.%M.%P' unless self.time.nil?
	#  end

end
