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

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" },
      :default_url => "/images/:style/missing.png",
      :url  => ":s3_domain_url",
      :path => "public/avatars/:id/:style_:basename.:extension",
      :storage => :fog,
      :fog_credentials => {
          provider: 'AWS',
          aws_access_key_id: ENV["AWS_ACCESS_KEY_ID"],
          aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"]
      },
      fog_directory: ENV["FOG_DIRECTORY"]
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end
