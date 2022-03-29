class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :experience_users
  has_many :experiences, through: :experience_users
  has_many :messages
  has_many :chatrooms, through: :chatroom_users
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  devise :omniauthable, omniauth_providers: %i[facebook]
  # devise :omniauthable, omniauth_providers: %i[github google_oauth2]
  has_one_attached :photo

  # def self.from_omniauth(auth)
  #   name_split = auth.info.name.split(" ")
  #   user = User.where(email: auth.info.email).first
  #   user ||= User.create!(provider: auth.provider, uid: auth.uid, last_name: name_split[0], first_name: name_split[1], email: auth.info.email, password: Devise.friendly_token[0, 20])
  #     user
  # end

  def self.find_for_facebook_oauth(auth)
    user_params = auth.slice("provider", "uid")
    user_params.merge! auth.info.slice("email", "first_name", "last_name")
    user_params[:facebook_picture_url] = auth.info.image
    user_params[:token] = auth.credentials.token
    user_params[:token_expiry] = Time.at(auth.credentials.expires_at)
    user_params = user_params.to_h

    user = User.find_by(provider: auth.provider, uid: auth.uid)
    user ||= User.find_by(email: auth.info.email) # User did a regular sign up in the past.
    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.save
    end

    return user
  end

  def self.from_omniauth(auth)
    user = User.find_by(email: auth.info.email)
    if user
      user.provider = auth.provider
      user.uid = auth.uid
      user.save
    else
      user = User.where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
      end
    end
    user
  end
end
