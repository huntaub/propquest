module QuestionsHelper
	def num_votes(question)
		total = 0
		question.votes.each do |vote|
			if vote.up
				total += 1
			else
				total -= 1
			end
		end
		total
	end
	
	def already_voted(user,question)
		unless Vote.find_by_user_id_and_question_id(user.id, question.id)
			false
		else
			true
		end
	end
	
end
