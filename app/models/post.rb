class Post < ApplicationRecord
belongs_to :group
belongs_to :user
has_many :comments, dependent: :destroy
has_many :likes, dependent: :destroy
has_many :like_users, through: :likes, source: :user

validates :text, presence: true, unless: :image?

mount_uploader :image, ImageUploader
end
