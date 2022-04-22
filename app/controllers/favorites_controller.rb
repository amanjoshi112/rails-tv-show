class FavoritesController < ApplicationController

	#before_action :require_signin
	#before_action :set_show

	def create
  		@show = Show.find(params[:id])
 		@show.favorites.create!(user: current_user)
		redirect_to show_path
	end

	def destroy
	  favorite = current_user.favorites.find(params[:id])
	  favorite.destroy
	  #@show = Show.find(params[:id])
	  redirect_to show_path
	end

	private
  		def set_show
    		@show = Show.find(params[:id])
  	end


end
