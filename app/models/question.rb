class Question < ActiveRecord::Base
	belongs_to :section
	belongs_to :answer
	belongs_to :user
	has_many   :votes
	validates_presence_of :title
	validates_presence_of :answer
	validates_presence_of :section
	validates_presence_of :user
	validates_uniqueness_of :title
	
	def self.random(section, except_array)
		ids = connection.select_all("SELECT #{self.primary_key} FROM #{self.table_name} WHERE section_id = #{section}")
		q = find(ids[rand(ids.size)][self.primary_key].to_i) unless ids.blank?
		if except_array.include?(q.id)
			self.random(section, except_array)
		else
			q
		end
	end
	
end