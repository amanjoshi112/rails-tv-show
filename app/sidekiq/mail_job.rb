class MailJob
  include Sidekiq::Job

  def perform
    # Do something
    tv_shows = Show.where(time: 30.minutes.from_now.beginning_of_minute)
      tv_shows.each do |show|
      # users who marked this show as favorite
      users = Favorite.where(show_id: show)  #show.favoritors   "channel_id = ?",params[:id] 
      # send mail to those users
        users.each do |user|
          @usr=User.find_by(id: user.user_id)
          UserMailer.checkout_email(show,@usr).deliver_now
        end
    end
  end
end
