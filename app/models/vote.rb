class Vote < ActiveRecord::Base
    belongs_to :user
    belongs_to :job
    #validates_uniqueness_of :vote_id, scope: :user_id
end
