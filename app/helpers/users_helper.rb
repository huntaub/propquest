module UsersHelper
	def user_name (user)
		unless user.role == 0
			user.name + ' (M)'
		else
			user.name
		end
	end
end