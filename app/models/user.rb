class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
acts_as_voter
has_many :jobs
has_many :like, dependent: :destroy
has_many :liked_votes, through: :like, source: :jobs
has_many :posts
has_many :resumes
has_one :profile
before_create :build_profile

acts_as_messageable

def name
	"User #{id}"
end

def mailboxer_email(object)
	nil
end


end
