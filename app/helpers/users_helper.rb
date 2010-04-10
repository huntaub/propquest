module UsersHelper
	def user_name (user)
		unless user.role == 0
			user.name + 'º'
		else
			user.name
		end
	end
	
	def num_questions_needing_description(user)
		user.questions.find_all_by_description_needed(true).length
	end
end