$(document).ready(function()
{
	$("#name").focus(function() {
		var f = $(this);
    	
    	f.addClass('active');
    	if (f.val() == "Name") { 
			f.val("");
    	}
    	
	});
	
    $("#name").focusout(function() {
		var f = $(this);
    
    	f.removeClass('active');
    	if (f.val() == "") { 
			f.val("Name");
    	}
    	
	});
	
	$("#email").focus(function() {
		var f = $(this);

    	f.addClass('active');    
    	if (f.val() == "Email") { 
			f.val("");
    	}
    	
	});
	
    $("#email").focusout(function() {
		var f = $(this);
    
    	f.removeClass('active');
    	if (f.val() == "") { 
			f.val("Email");
    	}
    	
	});
});