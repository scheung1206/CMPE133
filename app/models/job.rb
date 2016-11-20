class Job < ActiveRecord::Base
	belongs_to :user
    acts_as_votable
    acts_as_voter
    has_many :like, dependent: :destroy
    has_many :liked_users, through: :like, source: :user
	include PublicActivity::Model
	tracked

	def self.search(search)
			if search
				where(["company LIKE ?", "%#{search}%"])
			else
				all
			end
		end

end
