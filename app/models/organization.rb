class Organization < ActiveRecord::Base
  belongs_to :user
  has_many :users, dependent: :destroy
end
