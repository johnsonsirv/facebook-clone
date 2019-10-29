users = [
		{firstname: "Nahuel", lastname: "Castro", email: "nahukas@gmail.com", dob: "Sep 26 1984", sex: 'Male' },
		{firstname: "Miguel", lastname: "Prada", email: "mapra99@gmail.com", dob: "Sep 26 2001", sex: 'Male' },
		{firstname: "Tiago", lastname: "Ferreira", email: "tiferreira12@gmail.com", dob: "Dec 12 1987", sex: 'Male' },
		{firstname: "Binary", lastname: "Shloch", email: "shloch2007@yahoo.fr", dob: "Sep 27 1999", sex: 'Custom' },
		{firstname: "Marvelous", lastname: "Ubani", email: "marvellousubani@gmail.com", dob: "Sep 30 1999", sex: 'Custom' }
	]

users.each do |u|

	User.create(u)
	
end
