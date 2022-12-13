class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :trackable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[ facebook google_oauth2 ]

  has_one_attached :avatar

  attr_accessor :skip_password_validation

  has_many :bookings
  has_many :rooms
  has_many :booked_rooms, through: :bookings, source: :rooms
  has_one_attached :avatar
  
  enum role: %i[ guest host admin ]

  def self.from_omniauth(auth)
    find_or_create_by(provider: auth.provider, uid: auth.uid) do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end

  # def self.new_with_session(params, session)
  #   super.tap do |user|
  #     if data == session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
  #       user.email = data["email"] if user.email.blank?
  #     end
  #   end
  # end

  def password_required?
    return false if skip_password_validation
    super
  end
end
