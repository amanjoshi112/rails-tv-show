class UserMailer < ApplicationMailer

	def checkout_email(show,usr)
		@user=usr 
		@show=show
		mail(to: @user.email, subject: "Notification")

	end
end