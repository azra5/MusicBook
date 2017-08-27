class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(cookies[:user_id]) if cookies[:user_id]
  end

  helper_method :current_user

  def logged_in?
    current_user
  end

  helper_method :logged_in?

  def songDuration(duration)
    hours = duration/3600
    minutes = (duration % 3600)/60
    seconds = (duration % 60)

    return '' + hours.to_s.rjust(2, '0') + ':' + minutes.to_s.rjust(2, '0') + ':' + seconds.to_s.rjust(2, '0')
  end

  helper_method :songDuration

  def isFavourite(song_id)
    @favourites = Favourite.where(:user_id => cookies[:user_id], :song_id => song_id)
      if (@favourites.count > 0)
        return 'heart fa fa-heart'
      else return 'heart fa fa-heart-o'
end
  end

  helper_method :isFavourite


  protected

  def authorize
    redirect_to new_session_path unless current_user
  end

  def authorize_for_admins
    unless current_user.admin? || current_user.superadmin?
      flash[:notice] = 'Unauthorized access, you shall not pass!'
      redirect_to root_path
    end
  end
end
