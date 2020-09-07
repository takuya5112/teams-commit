class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :group_users
  has_many :groups, through: :group_users
  has_many :posts, dependent: :destroy
  has_many :comments
  has_many :likes
  has_many :liked_posts, through: :likes, source: :post

  validates :name, presence: true, uniqueness: true

  def already_liked?(post)
    self.likes.exists?(post_id: post.id)
  end
end
