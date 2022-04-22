namespace :email_notification do
  desc "TODO"
  task email_notofication: :environment do

      tv_shows = Show.where(time: 30.minutes.from_now.beginning_of_minute)
      tv_shows.each do |show|
      # users who marked this show as favorite
      users = Favorite.where(show_id => show)  #show.favoritors  
      # send mail to those users
        users.each do |userid|
          usr=User.where(id => userid)
          UserMailer.email_notification_favourite_user(show, usr).deliver_now
        end
    end

  end

end
