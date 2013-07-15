def logged_in?
	if session[:user] != "Logged In"
		redirect '/'
	end
end

def not_logged_in?
	if session[:user] == "Logged In"
		redirect '/all'
	end
end