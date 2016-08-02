class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

  # validates :first_name, :presence => true
  # validates :last_name, :presence => true
  validates :email, :presence => true, :format => { :with => email_regex }, :uniqueness => { :case_sensitive => false }
  validates :password, :presence => true

  has_many :skills, dependent: :destroy
  has_many :project_users, dependent: :destroy
  has_many :projects, through: :project_users
  has_many :posts, dependent: :destroy

end
