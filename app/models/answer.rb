class Answer < ActiveRecord::Base
	belongs_to :section
	has_many :questions
end
