# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

def logged_in 
  if session[:user_id].nil? || session[:user_id].blank?
    false
  elsif session[:user_id] == 'f'
    false
  else
    unless User.find_by_id(session[:user_id])
      false
    else
      true
    end
  end
end

def user_photo (user,size)
	if user.photo_file_name.blank?
		image_tag('default'+size.to_s+'.png', :class=>'uPhoto')
	else
		image_tag(user.photo.url(size), :class=>'uPhoto')
	end
end

end
