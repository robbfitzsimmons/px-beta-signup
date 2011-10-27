# Import all Models, Controllers, Helpers
Dir.glob("#{Dir.pwd}/models/*.rb") { |m| require "#{m.chomp}" }
Dir.glob("#{Dir.pwd}/controllers/*.rb") { |m| require "#{m.chomp}" }
Dir.glob("#{Dir.pwd}/helpers/*.rb") { |m| require "#{m.chomp}" }

# Set up database
DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite://#{Dir.pwd}/db/proximate_emails.db")

# Initialize (finalize) db
DataMapper.finalize

# Reset the db/tables and recreate
#DataMapper.auto_migrate!

# Create the db/tables if they don't exist
DataMapper::auto_upgrade!

use Rack::Flash
enable :sessions

get '/style.css' do
	scss :style
end