class Find < ActiveRecord::Base
  def find_names
      users = User.all
      users = users.where(["first_name LIKE?",first_name]) if first_name.present?
      users = users.where(["last_name LIKE?",last_name]) if last_name.present?
      return users
    end
end
