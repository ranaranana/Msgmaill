class User < ActiveRecord::Base
	has_many :messages
	has_many :contacts
  has_many :trashs
  has_many :events
  has_many :settings
	#has_many :key => "value",messages
	attr_accessor :login
  mount_uploader :image, ImageUploader
	#devise :registerable, :confirmable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :username, presence: true, length: {maximum: 255}, uniqueness: { case_sensitive: false }, format: { with: /\A[a-zA-Z0-9]*\z/, message: "may only contain letters and numbers." }
         private
def self.find_first_by_auth_conditions(warden_conditions)
  conditions = warden_conditions.dup
  if login = conditions.delete(:login)
    where(conditions).where(["username = :value OR lower(email) = lower(:value)", { :value => login }]).first
  else
    where(conditions).first
  end
end

  end
