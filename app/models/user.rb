class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :name, presence: true
  validates :email, length: { maximum: 50}
  validates :profile, length: { maximum: 200 }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :posts
  has_many :likes, dependent: :destroy
  has_many :groups, through: :group_users
  has_many :group_users
  has_many :groupposts
  
  mount_uploader :image, ImageUploader
end
