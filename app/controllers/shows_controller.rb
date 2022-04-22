class ShowsController < ApplicationController

	def index
		
		@shows= Show.search(params[:search])   #.where("channel_id = ?",params[:id] )
		if @shows.empty? 
			@shows= Show.where("channel_id = ?",params[:id] )
		end
	end

	def show
		@show = Show.find(params[:id])
		if current_user
		    @favorite = Favorite.find_by(user_id: current_user.id, show_id: @show.id )
		end
	end

	private
		def show_parms
			params.require(:show).permit(:name, :id, :search)
	end
end
