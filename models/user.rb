class User
  include DataMapper::Resource

  property :id,					 Serial    #
  property :name,        String    #
  property :email,       String    #

  validates_presence_of :name
  validates_presence_of :email
  validates_format_of :email, :as => :email_address
  validates_uniqueness_of :email
  
end