module QuestionsHelper
	def num_votes(question)
		question.vote_int
	end
	
	def already_voted(user,question)
		unless Vote.find_by_user_id_and_question_id(user.id, question.id)
			false
		else
			true
		end
	end
	
end
