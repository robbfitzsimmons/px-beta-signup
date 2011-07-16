require 'csv'

# Sign up Authenticates with OmniAuth via OmniAuthController
get '/?' do
	@user = User.new(params[:user])

	erb :'users/signup'
end

post '/signup' do
	@user = User.new(params[:user])

	if @user.save
		status(202)
		flash[:success] = "Thanks! We'll let you know when the app is released."
	else
		status(412)
		flash[:error] = "There was a problem with your name or email."
		@user.errors.each do |e|
		    puts e
		end
	end
	redirect '/'
end

get '/login/?' do

		not_logged_in?

	erb :'users/login'
end

post '/login' do


	password = "bulldozer"

	if params[:password] == "bulldozer"
		session[:user] = "Logged In"
		redirect '/all'
	end
end

get '/logout/?' do
	session[:user] = nil
	redirect '/'
end

##############################################################
# Show all users
get '/all' do

	logged_in?

	@title = "All Users"
	@users = User.all
	
	erb :'users/all', :layout => false
end

get '/export' do
	logged_in?

	users = User.all(:order => [:name.desc])

	headers "Content-Disposition" => "attachment;filename=ProximateLaunchMailingList#{Time.now.strftime("%Y-%m-%d--%I-%M%p")}.csv",
	"Content-Type" => "application/octet-stream"
	csv_string = CSV.generate do |csv|
		# header row
		csv << ["id", "Name", "Email"]
		# data rows
		users.each do |user|
	  	csv << ["#{user.id}", "#{user.name}", "#{user.email}"]
		end
	end
	csv_string
end
