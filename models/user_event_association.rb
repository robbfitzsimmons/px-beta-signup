class UserEventAssociation
  include DataMapper::Resource

  property :id,					  	Serial    #
 
  property :user_id,        String    # Links an event to a user
  property :event_id,		    String    # Links an user to an event
  
  property :admin,    			Boolean   # Is the user_id the admin of the event_id?
  property :checked_in, 		Boolean		# Has the user_id checked in on the day of event_id?

end