class ChannelsController < ApplicationController

	def index
		@channels=Channel.search(params[:search])
		if @channels.empty? 
			@channels=Channel.all
		end		
	end

	def show
		@favorite_movies = @user.favorite_movies
	end

	private
		def channel_parms
			params.require(:channel).permit(:name, :id, :search)
	end
end
