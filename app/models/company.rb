class Company < ActiveRecord::Base
  belongs_to :user
  mount_uploader :avatar, AvatarUploader
  validates :name, :description, uniqueness: { scope: :name, message: "company already exists!" }
  validates :name, :description, presence: true
end
