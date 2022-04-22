module FavoritesHelper
	def fave_or_unfave_button(show, favorite)
    	if favorite
      		button_to "♡ Unfave", favorite_path(show, favorite), method: :delete
    	else
      		button_to "♥️ Fave", favorites_path(show), method: :post
    	end
  	end
end
