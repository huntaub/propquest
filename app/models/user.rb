class User < ActiveRecord::Base
	has_many :questions
	has_many :votes
	has_attached_file :photo, :styles => { :small => "150x150>", :medium => "300x300>" },
	                  :url  => "/assets/users/:id/:style/:basename.:extension",
	                  :path => ":rails_root/public/assets/users/:id/:style/:basename.:extension"
	                  
	validates_uniqueness_of :name
	validates_presence_of :name
	validates_presence_of :hashed_password

	def self.authenticate(name,password)
		user = self.find_by_name(name)
		if user
			expected_password = encrypted_password(password,user.salt)
			if user.hashed_password != expected_password
				user = nil
			end
		end
		user
	end

	def password
		@password
	end
	
	def password=(pwd)
		@password = pwd
		return if pwd.blank?
		create_new_salt
		self.hashed_password = User.encrypted_password(self.password, self.salt)
	end
	
	def to_param
		URI.escape(name)
	end
	
private
	
		def self.encrypted_password(password,salt)
			string_to_hash = password + "aj939hfikh!@#fiu9" + salt
			Digest::SHA1.hexdigest(string_to_hash)
		end
	
		def create_new_salt
			self.salt = self.object_id.to_s + rand.to_s
		end

end